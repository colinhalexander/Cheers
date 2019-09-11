class Beer < ActiveRecord::Base
    has_many :reviews    
    has_many :users, through: :reviews
    belongs_to :brewery
    belongs_to :category

    def self.get_beer_info_by_name(beer_name)
        beer = self.find_by(name: beer_name)
        beer_info = {
            name: beer.name,
            abv: beer.abv,
            ibu: beer.ibu,
            description: beer.description,
            brewery: beer.brewery.name,
            category: beer.category.name
        }
    end
end