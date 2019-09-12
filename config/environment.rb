require "require_all"
require 'sinatra/activerecord'
require 'pry'
require 'paint'



require_all './app'

ActiveRecord::Base.establish_connection({
    :adapter => 'sqlite3', 
    :database => 'db/cheers.db'
})

# binding.pry 
0