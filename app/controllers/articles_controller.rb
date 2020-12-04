class ArticlesController < ApplicationController
  before_action :find_categories, only: [:new, :create]
  before_action :user_loggedin?, only: %i[update create new edit]
  before_action :is_mine?, only: %i[edit update]
  before_action :find_article, only: [:show, :edit, :update]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(title: article_params['title'], text: article_params['text'],
      author_id: session[:current_user]['id'], image: article_params['image'])
    
    if @article.save
      add_categories
      redirect_to articles_path, notice: 'Article successfully created'
    else
      render new_article_path
    end    
  end

  def update
    @article.title = article_params[:title]
    @article.text = article_params[:text]
    @article.image = article_params[:image]

    if @article.save
      @article.categories.delete_all
      add_categories
      redirect_to articles_path, notice: 'Article sucessfully updated'
    else
      render article_path(@article)
    end
  end

  def index
    if params[:user_id]
      @articles = User.find(params[:user_id]).articles
      @most_voted = @articles.most_voted.nil? ? nil : @articles.most_voted
    else
      @most_voted = Article.most_voted.nil? ? nil : Article.most_voted
      @articles = Article.all
    end  
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :image, categories: [])
  end

  def find_categories
    @categories = Category.all.order(:name)
  end

  def find_article
    @article = Article.find(params[:id])
    find_categories
  end

  def user_loggedin?
    redirect_to login_path if session[:current_user].nil?
  end

  def add_categories
    error = []
    categories = article_params['categories'][1..]
    categories.each do |category|
        @article_category = ArticleCategory.create(category_id: category, article_id: @article.id)
        if !@article_category.validate
          error << @article_category.validate!
        end
    end

    redirect_to articles_path, notice: error if error.any?
  end

  def is_mine?
    @article = Article.find(params[:id])
    if @article.author.id != session[:current_user]['id']
      redirect_to root_path, notice: "User is not allowed to edit this article"
    end
  end
end
