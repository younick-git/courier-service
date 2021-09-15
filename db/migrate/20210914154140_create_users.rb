class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :full_name
      t.string :address
      t.string :mobile_number
      t.string :pin_code
      t.string :email

      t.timestamps
    end
  end
end
