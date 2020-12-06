
require 'rails_helper'

RSpec.feature "the signin and signout process" do
  before :each do
    User.create(id:1, name: 'Marcelo', username: 'marcelomaidden')
    Article.create(id:1, author_id: 1, title: 'First article', 
      text: 'Beautiful article made by Marcelo in order to test the code', image: 'url for the image'
    )
    ArticleCategory.create(article_id: 1, category_id: 1)
  end

  let :login do
      visit login_path
      fill_in 'username', with: 'marcelomaidden'
      click_button 'Enter'    
  end

  it "signs me in with the right credentials" do
    login
    expect(page).to have_text 'LOG-OUT'
  end

  it "return an error when wrong sign in credentials were provided" do
    visit login_path
    fill_in 'username', with: 'marcelo'
    click_button 'Enter'    
    expect(page).to have_text 'Username not found'
  end

  it "signs me out" do
    login

    first('a', text: 'LOG-OUT').click

    expect(page).to have_text 'Login'
  end
end
