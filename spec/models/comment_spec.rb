require 'spec_helper'

describe Comment do
  it { should belong_to :user }
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :parent_id }
  it { should validate_presence_of :root_id }
  it { should allow_mass_assignment_of :title }
  it { should allow_mass_assignment_of :content }
end
