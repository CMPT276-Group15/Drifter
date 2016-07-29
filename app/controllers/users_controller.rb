class UsersController < ApplicationController
  #before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @users = User.paginate(page: params[:page], per_page:10)
  end
  
  def show
   #@user = User.find(params[:id])
   @microposts = @user.microposts.paginate(page: params[:page])
   @micropost = current_user.microposts.build if logged_in?
   @feed_items = @user.feed.paginate(page: params[:page])
  end

  def new
    @user = User.new

  end
  def create
    @user = User.new(user_params)
    if @user.save
       session[:user_id] = @user.id

       flash[:success] = "Hello #{@user.name}, welcome to Drifter!"

       redirect_to user_path(@user)
    else
       render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
      #@user = User.find(params[:id])
      if @user.update(user_params)
         flash[:success] = "Your account has been changed"
         redirect_to articles_path
      else
         render 'edit'
      end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end



  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user
           flash[:danger] = "You can only edit your own account"
           redirect_to root_path
        end
    end


end
