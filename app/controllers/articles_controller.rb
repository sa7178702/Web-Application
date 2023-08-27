class ArticlesController < ApplicationController
   include ArticlesHelper

  def index
    @article = Article.all
    @article = @article.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
     if @article.save
      redirect_to articles_path
       flash[:notice] = "Article create successful "
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
     if @article.update(article_params)
      redirect_to articles_path, notice: 'Update Article!'
    else
      render :edit
    end
  end

   def destroy
    @article = Article.find(params[:id])
     if @article.destroy
      redirect_to articles_path(@article), notice: 'Article destroy!'
    end
  end

 private
 # using helper method
 # def article_params
 #  params.require(:article).permit(:title, :description, :main_image)
 # end

end
