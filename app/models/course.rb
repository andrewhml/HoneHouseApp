class Course < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :units, order: :unit_number
  has_many :reviews

  validates :title, presence: true
  validates :subtitle, presence: true
  validates :sport, presence: true
  validates :url, presence: true
  validates :description, presence: true

  # This method associates the attribute ":course_image" with a file attachment
  has_attached_file :course_image, styles: {
    thumb: '100x100>',
    square: '200x200#',
    background: '1000x662>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :course_image, :content_type => /\Aimage\/.*\Z/

  def count_lessons
    lessons = 0
    self.units.each do |unit|
      lessons = lessons + unit.lessons.count
    end
    lessons
  end

  def count_resources
    resources = 0
    self.units.each do |unit|
      unit.lessons.each do |lesson|
        resources = resources + lesson.resources.count
      end
    end
    resources
  end
end
