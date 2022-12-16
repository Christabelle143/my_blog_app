require 'rails_helper'
RSpec.describe 'User index page features', type: :feature do
   before(:each) do
    # visit users_path

    @photo = 'https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/160/microsoft/58/ballot-box-with-x_2612.png'
   
    @user1 = User.create!(name: 'John Doe', bio: 'This is John Doe bio', photo: @photo, postsCounter: 16)
    @user2 = User.create!(
        name: 'Michal Smith', bio: 'This is Michal Smith bio', photo: @photo, postsCounter: 3
      )
    visit users_path
    end

    describe 'I can see' do
       it 'the profile picture for each user' do
        images = page.all('img')
        user_names = page.all('div h2')
        expect(images.size).to eql(user_names.size)
    end

       it 'the number of posts each user has written' do
        subscribers = page.all('article div span')
        expect(subscribers[0]).to have_content 'Number of posts: 16'
        expect(subscribers[1]).to have_content 'Number of posts: 3'
    end

       it 'should redirect to that user\'s show page when I click on a user.' do
        click_link 'John Doe'
        expect(page).to have_current_path user_path(@user1)
      end
    end
end