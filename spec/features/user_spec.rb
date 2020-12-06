require 'rails_helper'

RSpec.feature "Users", type: :feature do
  before :each do
    User.create(id:1, name: 'Marcelo', username: 'marcelomaidden')
    Article.create(id:1, author_id: 1, title: 'First article', 
      text: 'Beautiful article made by Marcelo in order to test the code', 
      image: 'url for the image'
    )
    ArticleCategory.create(article_id: 1, category_id: 1)
  end

  let :login do
    visit login_path
    fill_in 'username', with: 'marcelomaidden'
    click_on 'Enter'
  end

  context 'Register' do
    it 'Creates a new user' do
      visit '/users/new'
      fill_in 'user_name', with: 'Marcelo'
      fill_in 'user_username', with: 'marcelomaidden'
      click_on("Create User")

      expect(page).to have_text 'User successfully created'
    end
  end

  context 'Users' do
    it "Shows user's informations and useful links" do
      login
      visit '/users/1'

      expect(page).to have_text 'Marcelo'
    end

    it "Show all users" do
      login
  
      visit users_path
      expect(page).to have_text 'Marcelo'
      
    end
  end
end
