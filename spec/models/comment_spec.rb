require 'spec_helper'

describe Comment do
  it { should belong_to :user }
  it { should validate_uniqueness_of :content }
  it { should validate_presence_of :content }
  it { should validate_presence_of :user }
  it { should validate_presence_of :parent_id }
  it { should validate_presence_of :root_id }
  it { should allow_mass_assignment_of :content }
end
