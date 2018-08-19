class FavoriteAlbum < ApplicationRecord
	belongs_to :user, -> { with_deleted}
end
