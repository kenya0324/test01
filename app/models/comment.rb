class Comment < ApplicationRecord
	belongs_to :user
    belongs_to :post
    validates :content, presence: true
    validates :content, length: { maximum: 125 }
end
