class RelationshipsController < ApplicationController
  #Recurring Issue,line 3 !!v
  before_action :logged_in_user, only: [:edit, :update]
  def create 
    user = User.find(params[:followed_id]) 
    current_user.follow(user)
    redirect_to user
  end
  
  def destroy
    user = Relationship.find(params[:id]).followed 
    current_user.unfollow(user) 
    redirect_to user
  end
end
