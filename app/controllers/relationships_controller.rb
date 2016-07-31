class RelationshipsController < ApplicationController
  #Recurring Issue,line 3 !!v
  before_action :logged_in_user, only: [:edit, :update]
  def create 
    user = User.find(params[:followed_id]) 
    current_user.follow(user) 
    respond_to do |format| 
      format.html { redirect_to users_path } 
      format.js 
    end
  end
  
  def destroy
    user = Relationship.find(params[:id]).followed 
    current_user.unfollow(user) 
    respond_to do |format|
      format.html { redirect_to @user } 
      format.js 
    end
  end
end
