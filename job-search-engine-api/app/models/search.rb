class Search < ApplicationRecord
    belongs_to :user
    has_one :interest
end
