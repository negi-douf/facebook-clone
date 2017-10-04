class CommentsController < ApplicationController
  before_action :set_instances, only: [:edit, :update, :destroy]

  $errors = []

  def create
    @comment = current_user.comments.build(comments_params)
    @topic = @comment.topic

    # 要求に応じてレスポンス変更
    respond_to do |format|
      if @comment.save
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
    unless @comment.update(comments_params)
      $errors = @comment.errors
    end
    redirect_to topic_path(@topic)
  end

  def destroy
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

  def set_instances
    @comment = Comment.find(params[:id])
    @topic = @comment.topic
  end

  def set_errors
    unless $errors.empty?
      @errors = $errors
      $errors = []
    end
  end
end
