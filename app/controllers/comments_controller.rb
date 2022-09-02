class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    if logged_in?
      @comment = current_user.comments.new(comment_params)

      @comment.article_id = session[:article_id]

      respond_to do |format|
        if @comment.save
          format.html { redirect_to article_path(@comment.article) }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:content)
  end
end
