class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.text :role, default: 'student'

      t.timestamps
    end
  end
end
