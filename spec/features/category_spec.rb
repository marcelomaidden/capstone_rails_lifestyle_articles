require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before :each do
    User.create(id: 1, name: 'Marcelo', username: 'marcelomaidden')
    Category.create(id: 1, name: 'Beach', priority: 1)
    Category.create(id: 2, name: 'Beach', priority: 2)
    Article.create(id: 1, author_id: 1, title: 'First article',
                   text: 'Beautiful article made by Marcelo in order to test the code',
                   image: 'url for the image')
    ArticleCategory.create(article_id: 1, category_id: 1)
  end

  context 'Article from category' do
    it 'Show all articles from a filtered category' do
      visit 'categories/1/articles'
      expect(page).to have_text 'Author'
    end

    it 'Show a message when there are no article on the category' do
      visit 'categories/2/articles'
      expect(page).to have_text 'There are not articles on this category yet'
    end
  end
end
