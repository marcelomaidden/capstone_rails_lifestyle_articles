require 'rails_helper'

RSpec.feature 'Votes', type: :feature do
  before :each do
    User.create(id: 1, name: 'Marcelo', username: 'marcelomaidden')
    Article.create(id: 1, author_id: 1, title: 'First article',
                   text: 'Beautiful article made by Marcelo in order to test the code',
                   image: 'url for the image')
    ArticleCategory.create(article_id: 1, category_id: 1)
  end

  let :login do
    visit login_path
    fill_in 'username', with: 'marcelomaidden'
    click_on 'Enter'
  end

  context 'Votes' do
    it 'Register a vote' do
      login
      visit '/votes/new?article_id=1'

      expect(page).to have_text 'Vote registered successfully'
    end
    it 'Deletes a vote' do
      login
      visit '/votes/edit?article_id=1'

      expect(page).to have_text 'Vote successfully deleted'
    end
  end
end
