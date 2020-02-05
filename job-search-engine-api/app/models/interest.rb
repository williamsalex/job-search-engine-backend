class Interest < ApplicationRecord
    has_many :searches
    belongs_to :user, through: :searches
end
