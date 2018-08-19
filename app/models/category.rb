class Category < ApplicationRecord
	has_many :recruitment_categories, dependent: :destroy
	has_many :recruitments, through: :recruitment_categories

	has_many :user_categories, dependent: :destroy
	has_many :users, through: :user_categories
end
