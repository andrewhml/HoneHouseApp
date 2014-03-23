require 'spec_helper'

describe Membership do
  before(:each) do
    @user = create(:user)
    @course = create(:course)
  end
  it { should belong_to(:user) }
  it { should belong_to(:course) }

  it 'creates valid memberships between users and courses' do
    expect(create(:membership, user: @user, course: @course)).to be_valid
    expect(create(:membership, user: @user, course: @course, role: 'student')).to be_valid
  end

  it 'does not create invalid memberships between users and courses' do
    expect(build(:membership, user: @user, course: @courses, role: 'hello')).to_not be_valid
  end
end
