class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.references :unit, index: true

      t.timestamps
    end
  end
end
