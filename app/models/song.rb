class Song < ApplicationRecord
    belongs_to :user, :optional => true
    has_and_belongs_to_many :genres
    has_many :feeds
end
