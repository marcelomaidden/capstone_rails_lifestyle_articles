def article_basic
  User.create(id: 1, name: 'Marcelo', username: 'marcelomaidden')
  Article.create(id: 1, author_id: 1, title: 'First article',
                 text: 'Beautiful article made by Marcelo in order to test the code',
                 photo: Rack::Test::UploadedFile.new('spec/features/image.png', 'image/png'))
  ArticleCategory.create(article_id: 1, category_id: 1)
end
