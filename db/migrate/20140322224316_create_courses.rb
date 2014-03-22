class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.text :title
      t.text :subtitle
      t.text :sport

      t.timestamps
    end
  end
end
