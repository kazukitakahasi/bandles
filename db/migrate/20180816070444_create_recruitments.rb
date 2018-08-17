class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.integer :user_id
      t.integer :recruitment_type, default: 0, null: false, limit: 1
      t.string :title
      t.string :pref
      t.integer :activity_area, default: 0, null: false, limit: 1
      t.integer :activity_day, default: 0, null: false, limit: 1
      t.integer :activity_direction, default: 0, null: false, limit: 1
      t.integer :recruitment_gender, default: 0, null: false, limit: 1
      t.integer :recruitment_age
      t.integer :recruitment_age2
      t.integer :playing_music, default: 0, null: false, limit: 1
      t.string :sound_source
      t.text :introduction

      t.timestamps
    end
  end
end
