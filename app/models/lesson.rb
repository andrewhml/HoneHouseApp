class Lesson < ActiveRecord::Base
  validates :title, presence: true

  belongs_to :unit
  has_one :video, dependent: :destroy
  has_many :resources, dependent: :destroy

  def find_course
    unit_id = self.unit_id
    course_id = Unit.find(unit_id).course_id
    Course.find(course_id)
  end
end
