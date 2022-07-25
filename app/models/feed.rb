class Feed < ApplicationRecord
    belongs_to :song, :optional => true
    belongs_to :user, :optional => true
end
