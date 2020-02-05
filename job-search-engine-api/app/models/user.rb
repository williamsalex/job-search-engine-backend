class User < ApplicationRecord
    has_many :searches
    has_many :interests, through: :searches
end
