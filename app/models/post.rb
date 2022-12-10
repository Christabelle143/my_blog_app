class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  validates :title, :text, presence: true

  # validates :title, presence: true,
  #                   length: { maximum: 250, too_long: 'Title must not exceed 250 characters' }
  # validates_numericality_of :commentsCounter, only_integer: true, greater_than_or_equal: 0
  # validates_numericality_of :likesCounter, only_integer: true, greater_than_or_equal: 0

  after_save :update_postsCounter

  def most_recent_comments
    comments.order(created_at: :DESC).limit(5)
  end

  private

  def update_postsCounter
    author.increment!(:postsCounter)
  end

end
