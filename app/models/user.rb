class Favorite < ActiveRecord::Base
    has_many :favorites
    has_many :reviews
    has_many :beers, through: :favorites
    has_many :beers, through: :reviews
end