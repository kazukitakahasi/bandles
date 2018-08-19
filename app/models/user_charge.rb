class UserCharge < ApplicationRecord
	belongs_to :user, -> { with_deleted}
	belongs_to :charge
end
