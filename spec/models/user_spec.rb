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

  it 'does not allow users to be created without first_name, last_name, or email' do
    expect(build(:user, first_name: '')).to_not be_valid
    expect(build(:user, last_name: '')).to_not be_valid
    expect(build(:user, email: '')).to_not be_valid
  end

  it 'only allows the creation of general and admin accounts' do
    expect(create(:user, role: 'admin')).to be_valid
    expect(create(:user, role: 'general')).to be_valid
    expect(build(:user, role: 'hello')).to_not be_valid
  end

  it { should have_many(:courses).through(:memberships) }

  it { should have_many(:reviews) }
end
