class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :votes, as: :voteable

  validates :body, presence: true
end