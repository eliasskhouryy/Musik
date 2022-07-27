class User < ApplicationRecord
    has_secure_password
    # validates :password, length: {in: 8..20}
    validates :email, :uniqueness => true, :presence => true
    validates :name, :uniqueness => true, :presence => true
    has_many :feeds
    has_many :songs 
    has_many :genres, :through => :songs 
    has_one_attached :avatar
end
