class Post < ApplicationRecord
	belongs_to :user
	has_many :post_category_relations
    has_many :categories, through: :post_category_relations
    has_many :comments

    def self.search(search)
        if search
            Post.where(['content LIKE ?', "%#{search}%"])
        else
            Post.all
        end
    end
end
