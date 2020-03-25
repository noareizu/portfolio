class Comment < ApplicationRecord
	default_scope -> { order(created_at: :desc) }
	validates :comment, presence: true

	belongs_to :user
    belongs_to :article
end
