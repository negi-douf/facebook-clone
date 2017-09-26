class TopicsController < ApplicationController
  before_action :set_errors, only: [:index, :edit]

  # エラー出力用のグローバル変数
  # エラーメッセージを格納する
  $errors = []

  def index
    # 投稿用
    @topic = Topic.new
    # 一覧表示用
    @topics = Topic.all
  end

  def create
    @topic = Topic.new(topics_params)
    if @topic.save
      flash[:success] = "Topicを投稿しました！"
      redirect_to root_path
    else
      flash[:danger] = "ツイートの投稿に失敗しました"
      $errors = @tweet.errors
      redirect_to root_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  # strong parameter
  def topics_params
    params.require(:topic).permit(:content)
  end

  def set_errors
    unless $errors.empty?
      @errors = $errors
      $errors = []
    end
  end
end
