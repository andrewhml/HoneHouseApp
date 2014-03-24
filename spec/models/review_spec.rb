require 'spec_helper'

describe Review do
  before(:each) do
    @user = create(:user)
    @course = create(:course)
    @valid_review = create(:review, course: @course, user: @user)
  end

  it { should belong_to(:user)}

  it { should belong_to(:course) }

  it 'creates a valid review with a body, course, and a user' do
    expect(@valid_review).to be_valid
  end

  it 'does not create a review without a body' do
    expect(build(:review, body: nil)).to_not be_valid
  end
end
