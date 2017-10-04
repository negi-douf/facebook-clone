class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = current_user.comments.build(comments_params)
    @topic = @comment.topic

    # 要求に応じてレスポンス変更
    respond_to do |format|
      if @comment.save
        flash[:success] = "コメントを投稿しました！"
        format.html { redirect_to topic_path(@topic) }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @topic = @comment.topic

    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to topic_path(@topic) }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:topic_id, :content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
