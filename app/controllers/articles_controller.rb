class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    #This will prevent an undefined error when we load the view for the first time.
    @article = Article.new
  end

  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
      flash[:notice] = "Article was created successfully!" 
      redirect_to @article #redirect_to article_path(@article) <-- this would work too!
    else
      render 'new'
    end
  end

end