class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # エラー出力用のグローバル変数
  # エラーメッセージを格納する
  $errors = []

  def index
    # 投稿用
    @topic = Topic.new
    # 一覧表示用
    @topics = Topic.all.sort.reverse
    get_errors
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      flash[:success] = "Topicを投稿しました！"
      redirect_to root_path
    else
      flash[:danger] = "Topicの投稿に失敗しました"
      set_errors
      redirect_to root_path
    end
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  def edit
    get_errors
  end

  def update
    if @topic.update(topics_params)
      flash[:success] = "Topicを編集しました！"
    else
      flash[:danger] = "Topicの編集に失敗しました"
      set_errors
    end
    redirect_to root_path
  end

  def destroy
    if @topic.destroy
      flash[:success] = "Topicを削除しました！"
    else
      flash[:danger] = "Topicの削除に失敗しました"
      set_errors
    end
    redirect_to root_path
  end

  private

  # strong parameter
  def topics_params
    params.require(:topic).permit(:content, :picture, :picture_cache)
  end

  def set_errors
    if @review.invalid?
      $errors = @review.errors.full_messages
    end
  end

  def get_errors
    @errors = $errors
    $errors = []
  end

  # id からブログを特定するメソッド
  def set_topic
    @topic = Topic.find(params[:id])
  end
end
