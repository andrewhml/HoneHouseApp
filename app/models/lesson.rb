class Lesson < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :unit
  has_one :video
  has_many :resources

  def find_course
    unit_id = self.unit_id
    course_id = Unit.find(unit_id).course_id
    Course.find(course_id)
  end
end
