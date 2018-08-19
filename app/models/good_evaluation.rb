class GoodEvaluation < ApplicationRecord
	belongs_to :user, -> { with_deleted}
end
