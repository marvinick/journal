class PostCategory < ActiveRecord::Base
  belongs_to :post
  belongs_to :category
  has_many :posts, through: :post_categories
end