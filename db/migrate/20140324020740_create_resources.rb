class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.text :title
      t.text :url
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
