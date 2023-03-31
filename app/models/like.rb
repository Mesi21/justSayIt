class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_save :change_like_counter

  private

  def change_like_counter
    post.increment!(:likes_counter)
  end
end
