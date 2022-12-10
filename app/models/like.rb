class Like < ApplicationRecord
  validates :author_id, uniqueness: { scope: :post_id }
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :update_like_counter

  def update_like_counter
    post.increment!(:likesCounter)
  end
end
