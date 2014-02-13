class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :votes, as: :voteable

  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true

  def total_votes
    self.up_votes - self.down_votes
  end

  def up_votes
     self.votes.where(vote: true).size
  end

  def down_votes
    self.votes.where(vote: false).size
  end
end