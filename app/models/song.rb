class Song < ApplicationRecord
    belongs_to :user, :optional => true
    has_and_belongs_to_many :genres
    has_many :feeds
    has_attached_file :mp3
    validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", "audio/mp3"]}, :file_name => {:matches => [/mp3\Z/]}
end
