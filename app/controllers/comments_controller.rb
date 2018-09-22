class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic = Topic.find_by(id: params[:topic_id])
    @comment.topic_id = @topic.id
    @comment.user_id = @topic.user_id
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to topics_path, success: 'コメントに成功しました'
    else
      redirect_to topics_path, danger: 'コメントに失敗しました'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :topic_id, :user_id)
  end
end
