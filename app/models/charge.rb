class Charge < ApplicationRecord
	has_many :recruitment_charges, dependent: :destroy
	has_many :recruitments, through: :recruitment_charges

	has_many :user_charges, dependent: :destroy
	has_many :users, through: :user_charges
end
