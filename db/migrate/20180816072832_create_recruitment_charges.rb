class CreateRecruitmentCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitment_charges do |t|
      t.integer :charge_id
      t.integer :recruitment_id

      t.timestamps
    end
  end
end
