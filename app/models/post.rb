class Post < ApplicationRecord
    belongs_to :user
    has_many :likes
    has_many :comments

    def update_post_counter
        user.increment!(:postsCounter)
    end
    def most_recent_comments 
        comments.order(created_at: :DESC).limit(5)
    end
end
