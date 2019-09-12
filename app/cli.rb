require "tty-prompt"
require "tty-box"
require 'pry'

class Cli
    attr_reader :prompt, :box
    
    def initialize
        @prompt = TTY::Prompt.new
    end

    def prompt_for_beer_name
        @prompt.ask('Please enter the name of a beer:')
    end

    def display_beer_info(beer_info)
        puts "Here is your beer's information:"
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
        puts "==============================="
    end 

    def prompt_for_review
        puts "Review your beer:"
        rating = prompt_for_rating.to_i
        content = prompt_for_content
        if prompt_for_favorite == "yes"
            is_favorite = true
        else 
            is_favorite = false
        end

        review_hash = {
            rating: rating,
            content: content,
            is_favorite: is_favorite
        }
    end

    def prompt_for_favorite
        prompt.select("Would you like to save this beer to your favorites?", %w(yes no))
    end

    def prompt_for_content
        prompt.ask("Please leave a review of your beer:")
    end

    def prompt_for_rating
      choices = %w(1 2 3 4 5)
      prompt.select("Rate your beer:", choices)    
    end

    def display_welcome_page
        system("clear")
        box = TTY::Box.frame(width: 68, height: 10) do 
            "             _____ _    _ ______ ______ _____   _____ 
            / ____| |  | |  ____|  ____|  __ \\ / ____|
           | |    | |__| | |__  | |__  | |__) | (___  
           | |    |  __  |  __| |  __| |  _  / \\___ \\ 
           | |____| |  | | |____| |____| | \\ \\ ____) |
            \\_____|_|  |_|______|______|_|  \\_\\_____/ 

                       RATE YOUR BEER HERE!
            "
        end
        print box
    end

    def prompt_for_new_or_returning_user
        prompt.select("Are you a new or returning user?", ["Returning User", "New User"])
    end

    def prompt_for_new_username
        system("clear")
        prompt.ask("Please enter your new username:")
    end

    def prompt_for_returning_username
        user_names = User.pluck(:name)
        prompt.select("Please select your username", user_names)
    end
end