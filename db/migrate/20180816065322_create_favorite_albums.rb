class CreateFavoriteAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_albums do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
