class FeedsController < ApplicationController
  # before_action :check_for_login
  def new
  end

  def create
    feed = Feed.create feed_params
    @current_user.feeds << feed
    redirect_to feeds_path
  end

  def index
    @fuck = Feed.new
    @feeds = Feed.all
  end

  private
  def feed_params
    params.required(:feed).permit(:comment, :title)
  end
end
