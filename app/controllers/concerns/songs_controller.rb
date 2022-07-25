class SongsController < ApplicationController
    before_action :check_for_login
    def new
        @song = Song.new
    end

    def create
        song = Song.create song_params
        @current_user.songs << song
        redirect_to songs_path
    end

    def index
        @songs = Song.all
    end

    private
    def song_params
      params.required(:song).permit(:title, :bpm)
    end
end 