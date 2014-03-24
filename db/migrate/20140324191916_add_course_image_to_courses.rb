class AddCourseImageToCourses < ActiveRecord::Migration
  def self.up
    add_attachment :courses, :course_image
  end

  def self.down
    remove_attachment :courses, :course_image
  end
end
