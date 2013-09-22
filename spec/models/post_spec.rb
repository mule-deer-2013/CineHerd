require 'spec_helper'

describe Post do
  it { should validate_presence_of :content }
  it { should validate_presence_of :title }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :extension }

  it { should_not validate_presence_of :root_id }
  it { should_not validate_presence_of :parent_id }

  it { should allow_mass_assignment_of :cinemagraph}
  it { should validate_uniqueness_of :title}

  it { should belong_to :user }
end
