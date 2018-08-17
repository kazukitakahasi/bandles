class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.text :content
      t.integer :reported_user

      t.timestamps
    end
  end
end
