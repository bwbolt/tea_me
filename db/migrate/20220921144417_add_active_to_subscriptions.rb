class AddActiveToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :active, :integer, default: 1
  end
end
