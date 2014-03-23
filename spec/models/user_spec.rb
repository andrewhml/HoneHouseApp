require 'spec_helper'

describe User do
  before(:each) do
    DatabaseCleaner.start
    @user = create(:user)
    #@user1 = create(:user, first_name: '')
    #@user2 = create(:user, last_name: '')
    #@user3 = create(:user, email: '')
  end

  it 'creates valid users successfully' do
    expect(@user).to be_valid
  end

  it 'does not allow invalid users to be created' do
    expect(build(:user, first_name: '')).to_not be_valid
    expect(build(:user, last_name: '')).to_not be_valid
    expect(build(:user, email: '')).to_not be_valid
  end

  it { should have_many(:courses).through(:memberships) }
end
