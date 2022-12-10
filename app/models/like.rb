class Like < ApplicationRecord
  validates :author_id, uniqueness: { scope: :post_id }
  belongs_to :author, class_name: 'User'
  belongs_to :post
  def update_likeCounter
    post.increment!(:likesCounter)
  end
end
