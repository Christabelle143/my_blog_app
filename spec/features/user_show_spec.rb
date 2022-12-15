require 'rails_helper'

RSpec.describe 'user show view', type: :feature do
  before :each do
    visit user_session_path

    @photo = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/microsoft/58/ballot-box-with-x_2612.png'
    @user2 = User.create!(name: 'Michal Smith', bio: 'Lorem ipsum dolor sit amet', photo: @photo, postsCounter: 3)

    @post1 = @user2.posts.create!(title: 'Business', text: 'lorem_one', commentsCounter: 0, likesCounter: 0)
    @post2 = @user2.posts.create!(title: 'Education', text: 'lorem_two', commentsCounter: 0, likesCounter: 0)
    @post3 = @user2.posts.create!(title: 'Science', text: 'lorem_one', commentsCounter: 0, likesCounter: 0)

    visit user_path(@user2)
  end

  it 'Should see the user\'s profile picture' do
    image_src = page.find('img')['src']
    expect(image_src).to eql @photo
  end

  it 'Should see the user\'s username' do
    expect(page).to have_content 'Michal Smith'
  end

  it 'Should see the number of posts the user has written' do
    expect(page).to have_content 'Number of posts: 3'
  end

  it 'Should see the user\'s bio' do
    expect(page).to have_content 'Lorem ipsum dolor sit amet'
  end

  it 'Should see the user\'s first 3 posts.' do
    expect(page).to have_content 'lorem_one'
    expect(page).to have_content 'lorem_two'
    expect(page).to have_content 'lorem_one'
  end

  it 'I can see a button that lets me view all of a user\'s posts.' do
    expect(page).to have_content 'See all posts'
  end

  it 'When I click to see all posts, it redirects me to the user\'s post\'s index page.' do
    click_button 'See all posts'
    expect(page).to have_current_path user_posts_path(@user1)
  end
end