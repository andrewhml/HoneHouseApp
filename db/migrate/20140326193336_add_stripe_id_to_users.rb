class AddStripeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_id, :text, default: nil
  end
end
