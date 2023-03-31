class Comment < ApplicationRecord
  validates :text, presence: true
  belongs_to :post
  belongs_to :author, class_name: 'User'

  private

  def change_comment_counter
    post.increment!(:comments_counter)
  end
end
