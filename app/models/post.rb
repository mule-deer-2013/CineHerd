class Post < ActiveRecord::Base
  belongs_to :user
  has_many :votes, :as => :votable
  has_many :comments
  attr_accessible :content, :title, :user, :cinemagraph, :extension
  validates_presence_of :content, :title, :user, :extension
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

  def cinemagraph_still_filename
    File.join(CINEMAGRAPH_STORAGE, "#{self.id}_still.#{self.extension}")
  end

  def cinemagraph_path
    "/cinemagraph_storage/#{self.id}.#{self.extension}"
  end

  def cinemagraph_still_path
    "/cinemagraph_storage/#{self.id}_still.#{self.extension}"
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
      create_still(cinemagraph_filename)
      @file_data = nil
    end
  end

  def resize_cinemagraph(cinemagraph_filename)
    image = MiniMagick::Image.open(cinemagraph_filename)
      image.coalesce
      image.resize("600x400")
      image.write(cinemagraph_filename)
  end

  def create_still(cinemagraph_filename)
    image = MiniMagick::Image.open(cinemagraph_filename)
    image.collapse!
    image.colorspace("Gray")
    image.write(cinemagraph_still_filename)
  end
end
