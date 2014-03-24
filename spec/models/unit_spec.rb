require 'spec_helper'

describe Unit do
  before(:each) do
    @course = create(:course)
    @valid_unit = create(:unit, course: @course)
  end

  it { should belong_to(:course) }

  it { should have_many(:lessons) }

  it 'creates valid units belonging to a course' do
    expect(@valid_unit).to be_valid
  end

  it 'does not create units without a unit_number or title' do
    expect(build(:unit, unit_number: nil)).to_not be_valid
    expect(build(:unit, title: nil)).to_not be_valid
    expect(build(:unit, description: nil)).to be_valid
  end
end
