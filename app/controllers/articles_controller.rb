class ArticlesController < ApplicationController
  before_action :find_categories, only: [:new, :create]
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: article_params['title'], text: article_params['text'],
      author_id: session[:current_user]['id'], image: article_params['image'])
    
    if @article.save
      error = []
      categories = article_params['categories'][1..]
      categories.each do |category|
          @article_category = ArticleCategory.create(category_id: category, article_id: @article.id)
          if !@article_category.validate
            error << @article_category.validate!
          end
      end

      redirect_to articles_path, notice: error.any?
    else
      render new_article_path
    end    
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @most_voted = Article.most_voted.nil? ? nil : Article.most_voted
    @articles = Article.all
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :image, categories: [])
  end

  def find_categories

    @categories = Category.all.order(:name)
  end
end
