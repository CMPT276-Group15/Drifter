class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: "tree", password: "wood", except: [:index, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)   
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
      #render plain: params[:article].inspect
      @article = Article.new(article_params)
      @article.user = current_user
      if @article.save
          flash[:success] = "Article was successfully created!"
          redirect_to article_path(@article)
      else
          render 'new'  # render :new and render 'new' are the same
          flash[:danger] = "Article creation failed!"
      end
  end

  def update
     @article = Article.find(params[:id])
     @article.user = current_user
     if @article.update(article_params)
         flash[:success] = "Article was successfully updated!"
         redirect_to article_path(@article)
     else
         render 'edit'
         flash[:danger] = "Article update failed!"
     end
  end

  def destroy
     @article = Article.find(params[:id])
     @article.destroy
     flash[:danger] = "Article was successfully deleted!"
     redirect_to articles_path
     
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
    def require_same_user
       if  current_user != @article.user and !current_user.admin?
           flash[:danger] = "You can only edit or delete your own articles"
           redirect_to root_path
       end
    end
end
