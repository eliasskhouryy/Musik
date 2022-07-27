class SongsController < ApplicationController
    before_action :check_for_login
    def new
        @song = Song.new

    end

    def create
        @song = Song.new song_params
        if params[:file].present?
            req = Cloudinary::Uploader.upload params[:file]
            @song.image = req["public_id"]
            @song.save
            @current_user.songs << @song

          end
        redirect_to songs_path

    end

    def index
        @songs = Song.all
    end

    def destroy
    @song = Song.find params[:id]
    @song.destroy
    redirect_to songs_path
    end

    private
    def song_params
      params.required(:song).permit(:title, :bpm, :sound)
    end
end 