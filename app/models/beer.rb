class Beer < ActiveRecord::Base
    has_many :favorites    
    has_many :reviews    
    has_many :users, through: :favorites
    has_many :users, through: :reviews
    belongs_to :brewery
    belongs_to :category
end