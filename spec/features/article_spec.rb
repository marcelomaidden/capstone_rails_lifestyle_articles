# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.feature 'Articles', type: :feature do
  before :each do
    User.create(id: 2, name: 'Marcelo', username: 'marcelomaidden')
    Category.create(name: 'Beach', priority: 1)
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

      expect(page).to have_text 'Please add a category'
    end

    it 'Creates an article when all fields were filled' do
      login
      visit new_article_path
      within('#new_article') do
        fill_in 'article_title', with: 'My first article'
        fill_in 'article_text', with: 'This article was made to test if an article is valid'
        select('Beach', from: 'article_categories').select_option
        attach_file 'article_photo', "#{Rails.root}/spec/features/image.png"
        click_on 'Create Article'
      end

      expect(page).to have_text 'Article successfully created'
    end
  end
end

# rubocop:enable Metrics/BlockLength
