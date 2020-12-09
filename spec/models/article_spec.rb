# rubocop:disable Metrics/BlockLength

require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:each) do
    User.create(id: 1, name: 'Marcelo', username: 'marcelomaidden')
  end

  context 'Create article' do
    it 'Create a valid article' do
      article = Article.new(author_id: 1, title: 'My first article',
                            text: 'This article was made in order to test the model integration',
                            image: 'my image url')

      expect(article).to be_valid
    end

    it "Validation error when it doesn't have a title" do
      article = Article.new(author_id: 1,
                            text: 'This article was made in order to test the model integration',
                            image: 'my image url')

      expect(article).to_not be_valid
    end

    it "Validation error when it doesn't have a text" do
      article = Article.new(author_id: 1, title: 'My first article',
                            image: 'my image url')

      expect(article).to_not be_valid
    end

    it "Validation error when it doesn't have an author" do
      article = Article.new(title: 'My first article',
                            text: 'This article was made in order to test the model integration',
                            image: 'my image url')

      expect(article).to_not be_valid
    end

    it "Validation error when it doesn't have an image" do
      article = Article.new(author_id: 1, title: 'My first article',
                            text: 'This article was made in order to test the model integration')

      expect(article).to_not be_valid
    end

    it "Validates when article's title length is bigger" do
      article = Article.new(author_id: 1,
                            title: 'My first articleMy first articleMy first articleMy first article
        My first articleMy first articleMy first article
        My first article',
                            text: 'This article was made in order to test the model integration',
                            image: 'my image url')

      expect(article).to_not be_valid
    end

    it "Validates when article's text length doesn't comply the minimum size" do
      article = Article.new(author_id: 1,
                            title: 'My first article',
                            text: 'This article ',
                            image: 'my image url')

      expect(article).to_not be_valid
    end
  end
end

# rubocop:enable Metrics/BlockLength
