require "tty-prompt"
require 'pry'

class Cli
    attr_reader :prompt
    
    def initialize
        @prompt = TTY::Prompt.new
    end

    # #def Welcome
    #   puts "Cheers"
    # end

    # def name
    #  name = @prompt.ask('What is your name?', default: ENV['USER'])
    # end

    def prompt_for_beer_name
        @prompt.ask('Please enter the name of a beer:')
    end

    def display_beer_info(beer_info)
        puts "Name: #{beer_info[:name]}"
        puts "Brewery: #{beer_info[:brewery]}"
        puts "Category: #{beer_info[:category]}"
        puts "ABV: #{beer_info[:abv]}%"
        puts "IBU: #{beer_info[:ibu]}"
        if beer_info[:description] != nil
            puts "Description: #{beer_info[:description]}"
        else
            puts "Description: Tasty beer!"
        end
    end

    # def like_beer
    #  prompt.yes?('Do you like beer? Y/N')
    # end

    # def current_beer
    #   prompt.select("What beer are you drinking right now?", %w(Lager Pilsner Ale))
    # end  

    # def rate_beer
    #   choices = %w(1 2 3 4 5)
    #   prompt.multi_select("Rate your beer:", choices)    
    # end

    # def recommendations
        # prompt.yes?('Would you like a recommendation? Y/N')
    # end
end

# cli = Cli.new

# binding.pry
