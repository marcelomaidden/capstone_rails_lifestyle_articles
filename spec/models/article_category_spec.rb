require 'rails_helper'

RSpec.describe ArticleCategory, type: :model do
  before :each do
    @user = User.create(id: 1, name: 'Marcelo', username: 'marcelomaiden')
    @article = Article.create(id: 1, author_id: 1, title: 'My first article',
                              text: 'This article was made in order to test the model integration',
                              image: 'my image url')

    @category = Category.create(id: 1, name: 'Beach', priority: 1)
  end

  context 'Add article to a category' do
    it 'Add a valid category' do
      @article_category = ArticleCategory.new(category_id: 1, article_id: @article.id)

      expect(@article_category).to be_valid
    end

    it "Validation error when it doesn't have a category" do
      @article_category = ArticleCategory.new(article_id: 1)

      expect(@article_category).to_not be_valid
    end

    it "Validation error when it doesn't have an article" do
      @article_category = ArticleCategory.new(category_id: 1)

      expect(@article_category).to_not be_valid
    end
  end
end
