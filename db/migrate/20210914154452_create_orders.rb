class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.integer :weight
      t.integer :service_type
      t.integer :service_cost
      t.integer :payment_mode
      t.integer :status, default: 0
      t.uuid :sender_id
      t.uuid :receiver_id
      t.string :order_id

      t.timestamps

      t.index :sender_id
      t.index :receiver_id
    end
  end
end
