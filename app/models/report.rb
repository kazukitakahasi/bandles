class Report < ApplicationRecord
	belongs_to :user, -> { with_deleted}
end
