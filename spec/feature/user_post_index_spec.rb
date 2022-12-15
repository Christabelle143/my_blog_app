# require 'rails_helper'

# RSpec.describe 'Post Index Page Features', type: :feature, js: true do
#   before(:each) do
#     visit users_path

#     @photo = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/microsoft/58/ballot-box-with-x_2612.png'

#     @user1 = User.create!(
#       name: 'John Doe', bio: 'This is John Doe bio', photo: @photo, postsCounter: 16
#     )
#     @user2 = User.create!(
#       name: 'Michal Smith', bio: 'This is Michal Smith bio', photo: @photo, postsCounter: 3
#     )

#     @post1 = @user1.posts.create!(
#       title: 'Education', text: 'This is first Educat post!', commentsCounter: 0, likesCounter: 0
#     )
#     @post2 = @user1.posts.create!(
#       title: 'Sport', text: 'This is second Sport post!', commentsCounter: 0, likesCounter: 0
#     )
#     @post3 = @user2.posts.create!(
#       title: 'Business', text: 'This is third!', commentsCounter: 0, likesCounter: 0
#     )

#     # Comments

#     @user1.comments.create!(text: 'Really nice post', post: @post1)
#     @user2.comments.create!(text: 'Amezing', post: @post1)
#     @user2.comments.create!(text: 'Fantastic', post: @post2)

#     # likes
    
#     @user1.likes.create!(post: @post1)
#     @user1.likes.create!(post: @post2)
#     @user2.likes.create!(post: @post1)
#     @user2.likes.create!(post: @post3)

#     visit user_posts_path(@user1)
#   end

#   describe 'I can see' do
#     it 'the user\'s profile picture' do
#       image = page.find('img')['src']
#       expect(image).to eql @photo
#     end

#     it 'the user\'s username' do
#       expect(page).to have_content 'John Doe'
#     end

#     it 'the number of posts the user has written' do
#       expect(page).to have_content('Number of posts: 16')
#     end

#     it 'some post\'s title.' do
#       expect(page).to have_content 'Education'
#       expect(page).to have_content 'Sport'
#     end

#     it 'some of the post\'s body.' do
#       expect(page).to have_content 'This is first Educat post!'
#       expect(page).to have_content 'This is second Sport post!'
#     end

#     it 'the first comments on a post.' do
#       expect(page).to have_content 'Really nice post'
#     end

#     it 'how many comments a post has' do
#       expect(page).to have_content('Comments: 2')
#     end

#     it 'how many likes a post has' do
#       expect(page).to have_content('Likes: 2')
#     end

#     it 'a section for pagination if there are more posts than fit on the view.' do
#       expect(page).to have_content('Add Post')
#     end

#     it 'When I click on a post, it redirects me to that post\'s show page.' do
#       click_link 'Education'
#       expect(page).to have_current_path user_post_path(@user1, @post1)
#     end
#   end
# end