class Feed < ApplicationRecord
    has_many :songs
    belongs_to :user, :optional => true
    has_many :song, :through => :user
end
