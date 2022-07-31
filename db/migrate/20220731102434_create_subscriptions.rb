class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :accounts
      t.references :community
      t.timestamps
    end
  end
end
