class FeedsController < ApplicationController
  before_action :check_for_login
  def new
    @feed = Feed.new
  end

  def create
    feed = Feed.create feed_params
    @current_user.feeds << feed
    redirect_to feeds_path
  end

  def index
    @feed = Feed.new
    @feeds = Feed.all
  end


  def destroy
    feed = Feed.find params[:id]
    feed.destroy
  end

  private
  def feed_params
    params.required(:feed).permit(:comment)
  end
end
