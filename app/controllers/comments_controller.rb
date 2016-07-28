class CommentsController < ApplicationController
  #  http_basic_authenticate_with name: "tree", password: "wood", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.username = current_user.name
    if @comment.save
        flash[:success] = "New comment created!"
        redirect_to article_path(@comment.article)
    else
        redirect_to article_path(@comment.article)
        flash[:danger] = "Comment creation failed!"
    end

  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
