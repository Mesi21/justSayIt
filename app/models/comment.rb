class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :post
  belongs_to :user

  private

  def change_comment_counter
    post.increment!(:comments_counter)
  end
end
