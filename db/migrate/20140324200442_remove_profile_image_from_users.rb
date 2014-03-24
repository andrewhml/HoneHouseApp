class RemoveProfileImageFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :profile_image
  end

  def self.down
    add_column :users, :profile_image, :text
  end
end
