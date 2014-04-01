require 'faker'
class TestData
  SPORTS = ['Lacrosse', 'Baseball', 'Football', 'Basketball', 'Hockey']
  def self.build(num)
    Course.delete_all
    Unit.delete_all
    Lesson.delete_all
    mike = User.find(1)
    binding.pry
    num.times do |i|
      course = Course.create!(title: "#{Faker::Lorem.word}", subtitle: "#{Faker::Lorem.sentence}", url: "//www.youtube.com/embed/PshZbUfGV6M", description: "#{Faker::Lorem.sentence}", sport: SPORTS.sample)
      Membership.create!(user_id: mike.id, course_id: course.id, role: 'teacher')
      3.times do |j|
        unit = Unit.create!(unit_number: (j + 1), title: "#{Faker::Lorem.word}", description: "#{Faker::Lorem.sentence}", course_id: course.id)
        3.times do |l|
          Lesson.create!(title: "#{Faker::Lorem.word}", description: "#{Faker::Lorem.sentence}", unit_id: unit.id)
        end
      end
    end
    puts "Courses, units, and lessons created"
  end
end
