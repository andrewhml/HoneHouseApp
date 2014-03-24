class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.references :lesson, index: true

      t.timestamps
    end
  end
end
