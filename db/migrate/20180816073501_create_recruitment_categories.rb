class CreateRecruitmentCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitment_categories do |t|
      t.integer :category_id
      t.integer :recruitment_id

      t.timestamps
    end
  end
end
