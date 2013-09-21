class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :parent_id, :root_id, :title, :user_id, :cinemagraph
  validates_presence_of :content, :title, :user_id
  validates_uniqueness_of :title

  after_save :store_cinemagraph

  include MiniMagick

  def cinemagraph=(file_data)
    unless file_data.blank?
      @file_data = file_data
      self.extension = file_data.original_filename.split('.').last.downcase
    end
  end

  def cinemagraph_filename
    File.join(CINEMAGRAPH_STORAGE, "#{self.id}.#{self.extension}")
  end

  def cinemagraph_path
    "/cinemagraph_storage/#{self.id}.#{self.extension}"
  end

  def has_cinemagraph?
    File.exists?(cinemagraph_filename)
  end

  CINEMAGRAPH_STORAGE = File.join(Rails.root, 'public', 'cinemagraph_storage')

  private

  def store_cinemagraph
    if @file_data
      FileUtils.mkdir_p CINEMAGRAPH_STORAGE
      File.open(cinemagraph_filename, 'wb') do |f|
        f.write(@file_data.read)
      end
      resize_cinemagraph(cinemagraph_filename)
      @file_data = nil
    end
  end

  def resize_cinemagraph(cinemagraph)
    image = MiniMagick::Image.open(cinemagraph)
      image.coalesce
      image.resize("600x600")
      image.write(cinemagraph)
  end
end
