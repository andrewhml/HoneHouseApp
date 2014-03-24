class AddUrlToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :url, :text
  end
end
