class ArticlesController < ApplicationController

    def index
      @article = Article.all
    end

    def new
      @article = Article.new
      @category = Category.all
    end

    def create
      @article = Article.create(article_params)
      if @article.save
        flash[:success] = "Article has been added"
         redirect_to articles_path
      else
        render "new"
      end
    end

    def edit
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
       if @article.update(article_params)
         flash[:success] = "Your post has been updated"
        redirect_to article_path
      else
        render "edit"
      end
    end

    def show
      @article = Article.find(params[:id])
    end

    def destroy
       @article = Article.find(params[:id])
       @article.destroy
       flash[:success] = "Your post has been deleted"
       redirect_to articles_path
    end

  private
   def article_params
     params.require(:article).permit(:title, :body, :category)
   end

end
