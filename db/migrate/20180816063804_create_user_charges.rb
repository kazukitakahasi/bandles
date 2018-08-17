class CreateUserCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_charges do |t|
      t.integer :charge_id
      t.integer :user_id

      t.timestamps
    end
  end
end
