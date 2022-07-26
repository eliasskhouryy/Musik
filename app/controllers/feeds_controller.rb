class FeedsController < ApplicationController
  before_action :check_for_login #Checks the page for the @current_user
  def new
    @feed = Feed.new
  end

  def create
    feed = Feed.create feed_params
    @current_user.feeds << feed #Adds the feed to the current user table
    song = Song.find_by :title => params[:feed][:song_id]
    feed.song = song
    feed.save
    redirect_to feeds_path
  end

  def index
    @feed = Feed.new
    @feeds = Feed.all
  end

  def destroy
    @feed = Feed.find params[:id]
    @feed.destroy
    redirect_to feeds_path
  end

  private
  def feed_params
    params.required(:feed).permit(:comment, :song_id)
  end
end
