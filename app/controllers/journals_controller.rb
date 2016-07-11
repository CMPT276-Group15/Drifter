class JournalsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create 
    @journal = current_user.journals.build(journal_params) 
    if @journal.save 
      flash[:success] = "Journal created!" 
      redirect_to root_url 
    else
      render 'welcome/index' 
    end
  end
  def destroy 
  end
  
  private
  def journal_params 
    params.require(:journal).permit(:content) 
  end

end
