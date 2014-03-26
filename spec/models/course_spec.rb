require 'spec_helper'

describe Course do
  before(:each) do
    @resource = create(:resource, lesson: @lesson)
    @lesson = create(:lesson, unit: @unit)
    @unit = create(:unit, course: @course)
    @user = create(:user)
    @course = create(:course)
  end
  it 'creates valid courses' do
    expect(create(:course)).to be_valid
  end

  it 'does not create invalid courses' do
    expect(build(:course, title: nil)).to_not be_valid
    expect(build(:course, subtitle: nil)).to_not be_valid
    expect(build(:course, sport: nil)).to_not be_valid
    expect(build(:course, url: nil)).to_not be_valid
    expect(build(:course, description: nil)).to_not be_valid
  end

  describe '#count_lessons' do
    it 'correctly calculates the number of lessons  in a course' do
      course = create(:course)
      course2 = create(:course)
      unit = create(:unit, course: course)
      lesson = create(:lesson, unit: unit)
      resource = create(:resource, lesson: lesson)
      expect(course.count_lessons).to eq 1
      expect(course2.count_lessons).to eq 0
    end
  end

  describe '#count_resources' do
    it 'correctly calculates the number of lessons in a course with lessons' do
      course = create(:course)
      course2 = create(:course)
      unit = create(:unit, course: course)
      lesson = create(:lesson, unit: unit)
      resource = create(:resource, lesson: lesson)
      resource2 = create(:resource, lesson: lesson)
      expect(course.count_resources).to eq 2
    end
    it 'correctly calculates the number of lessons in a course without lessons' do
      course = create(:course)
      course2 = create(:course)
      unit = create(:unit, course: course)
      lesson = create(:lesson, unit: unit)
      resource = create(:resource, lesson: lesson)
      resource2 = create(:resource, lesson: lesson)
      expect(course2.count_resources).to eq 0
    end
  end

  describe '#find_teacher' do
    it 'finds the teacher of a given class' do
      user = create(:user)
      course = create(:course)
      membership = create(:membership, user: user, course: course, role: 'teacher')

      expect(course.find_teacher).to eq user
    end
  end

  describe '#check_membership' do
    before(:each) do
      @user = create(:user)
      @user2 = create(:user)
      @course = create(:course)
    end
    it 'returns true if the user is registered as a student' do
      membership = create(:membership, user: @user, course: @course, role: 'student')
      expect(@course.check_membership(@user)).to be true
    end

    it 'returns false if the user is registered as a teacher' do
      membership = create(:membership, user: @user, course: @course)
      expect(@course.check_membership(@user)).to be false
    end

    it 'returns false if the user is not registered for the course' do
      membership = create(:membership, user: @user, course: @course)
      expect(@course.check_membership(@user2)).to be false
    end
  end

  it { should have_many(:users).through(:memberships) }
  it { should have_many(:units) }
  it { should have_many(:reviews) }
end
