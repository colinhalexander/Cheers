require "tty-prompt"

prompt = TTY::Prompt.new

# #def Welcome
#   puts "Cheers"
# end

# def name
#  prompt.ask('What is your name?', default: ENV['USER'])
# end

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
    prompt.yes?('Would you like a recommendation? Y/N')
# end

