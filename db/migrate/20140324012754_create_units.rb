class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :unit_number
      t.string :title
      t.text :description
      t.references :course, index: true

      t.timestamps
    end
  end
end
