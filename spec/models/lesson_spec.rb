require 'spec_helper'

describe Lesson do
  before(:each) do
    @unit = create(:unit)
    @valid_lesson = create(:lesson, unit: @unit)
    @invalid_lesson = build(:lesson, title: nil, unit: @unit)
  end
  it { should belong_to(:unit) }

  it { should have_one(:video) }

  it { should have_many(:resources) }

  it 'creates a valid lesson with title, description, and unit' do
    expect(@valid_lesson).to be_valid
  end

  it 'does not create a lesson without a title' do
    expect(@invalid_lesson).to_not be_valid
  end
end
