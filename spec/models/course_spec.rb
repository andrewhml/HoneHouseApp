require 'spec_helper'

describe Course do
  before(:each) do
    @user = create(:user)
  end
  it 'creates valid courses' do
    expect(create(:course)).to be_valid
  end

  it 'does not create invalid courses' do
    expect(build(:course, title: '')).to_not be_valid
    expect(build(:course, subtitle: '')).to_not be_valid
    expect(build(:course, sport: '')).to_not be_valid
  end

  it { should have_many(:users).through(:memberships) }
  it { should have_many(:units) }
end