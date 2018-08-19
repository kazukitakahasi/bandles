class UserCategory < ApplicationRecord
	belongs_to :user, -> { with_deleted}
	belongs_to :category
end
