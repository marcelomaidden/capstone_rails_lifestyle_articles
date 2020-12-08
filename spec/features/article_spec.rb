# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
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

  context 'Write an article' do
    it 'Renders template to write an article' do
      login
      visit root_path

      first('a', text: 'Write an article').click

      expect(page).to have_content(/Create an article/i)
    end

    it 'Returns validation errors if user tries to create article without fill information' do
      login
      visit new_article_path
      click_on 'Create Article'

      expect(page).to have_text "can't be blank"
    end

    it 'Creates an article when all fields were filled' do
      login
      visit new_article_path
      within('#new_article') do
        fill_in 'article_title', with: 'My first article'
        fill_in 'article_text', with: 'This article was made to test if an article is valid'
        fill_in 'article_image', with: "Images' url"
        click_on 'Create Article'
      end

      expect(page).to have_text 'Article successfully created'
    end
  end
end

# rubocop:enable Metrics/BlockLength
