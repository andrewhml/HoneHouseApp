require 'spec_helper'

describe Resource do
  before(:each) do
    @lesson = create(:lesson)
    @valid_resource = create(:resource, lesson: @lesson)
  end
  it { should belong_to(:lesson) }

  it 'creates a valid resource with title, url, and lesson' do
    expect(@valid_resource).to be_valid
  end

  it 'does not create a resource without a title or url' do
    expect(build(:resource, title: nil)).to_not be_valid
    expect(build(:resource, url: nil)).to_not be_valid
  end
end
