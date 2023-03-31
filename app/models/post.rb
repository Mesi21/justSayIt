class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  after_save :update_post_counter

  private

  def change_post_counter
    user.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order('created_at DESC').last(5)
  end
end