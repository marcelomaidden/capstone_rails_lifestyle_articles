require 'rails_helper'

RSpec.describe Vote, type: :model do
  before :each do
    User.create(id: 1, name: 'marcelo', username: 'marcelomaidden')
    Article.create(id: 1, author_id: 1, title: 'My first article',
                   text: 'This article was made in order to test the model integration',
                   image: 'my image url')
  end

  context 'Register a vote' do
    it 'Creates a valid vote' do
      vote = Vote.new(user_id: 1, article_id: 1)

      expect(vote).to be_valid
    end

    it 'Validates if user is present' do
      vote = Vote.new(article_id: 1)

      expect(vote).to_not be_valid
    end

    it 'Validates if article is present' do
      vote = Vote.new(article_id: 1)

      expect(vote).to_not be_valid
    end

    it 'Throws error if user has already voted on the same article' do
      vote = Vote.new(user_id: 1, article_id: 1)
      vote.save
      vote2 = Vote.new(user_id: 1, article_id: 1)
      expect { vote2.save }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
