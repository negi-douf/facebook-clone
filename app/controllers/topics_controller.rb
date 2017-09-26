class TopicsController < ApplicationController
  def index
    # 投稿用
    @topic = Topic.new
    # 一覧表示用
    @topics = Topic.all
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
