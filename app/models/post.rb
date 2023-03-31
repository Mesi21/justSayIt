class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :change_post_counter

  private

  def change_post_counter
    author.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order('created_at DESC').last(5)
  end
end
