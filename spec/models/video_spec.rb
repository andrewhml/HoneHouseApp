require 'spec_helper'

describe Video do
  before(:each) do
    @lesson = create(:lesson)
    @valid_video = create(:video, lesson: @lesson)
    @invalid_video = build(:video, url: nil)
  end
  it { should belong_to(:lesson) }

  it 'creates a valid video with a url and a lesson' do
    expect(@valid_video).to be_valid
  end

  it 'does not create a video without a url' do
    expect(@invalid_video).to_not be_valid
  end
end
