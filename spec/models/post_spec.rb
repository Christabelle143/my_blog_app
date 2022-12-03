require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do
    @user = User.new(id: 1, name: 'Ben', bio: 'My bio about my self and else', photo: '', postsCounter: 0)
    @post = Post.new(title: 'Post1', text: 'Some text about the post', author_id: @user.id)
    @comment = Comment.new(text: 'Nice Post', author_id: @user.id, post_id: @user.id)
  end

  describe 'validation tests' do
    it 'validates the title is a text' do
      expect(@post.title).to eq('Post1')
    end

    it 'validates the post text' do
      expect(@post.text).to eq('Some text about the post')
    end

    it 'validates the author_id is an integer' do
        expect(@post.author_id).to eq(1)
    end
end
end
