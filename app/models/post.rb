class Post < ApplicationRecord
	belongs_to :user
	has_many :post_category_relations
    has_many :categories, through: :post_category_relations
    has_many :comments
    validates :post_content, presence: true
    validates :post_content, length: { maximum: 110 }

    def self.search(search)
        if search
            Post.where(['content LIKE ?', "%#{search}%"])
        else
            Post.all
        end
    end
end
