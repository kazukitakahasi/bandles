class CreateGoodEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :good_evaluations do |t|
      t.integer :user_id
      t.integer :evaluated_user

      t.timestamps
    end
  end
end
