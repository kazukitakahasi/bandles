class Message < ApplicationRecord
	belongs_to :user, -> { with_deleted}

	validates :content,
    presence:true
end
