require_relative "./config/environment.rb"
require 'sinatra/activerecord/rake'
require 'csv'
require 'sqlite3'

desc "parse csv"

task :csv do 
  db = SQLite3::Database.new("db/cheers.db")
  db.execute("CREATE TABLE IF NOT EXISTS categories (
    id INTEGER PRIMARY KEY,
    name
  )")

  csv_text = File.read("categories.csv")
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    db.execute("INSERT INTO categories (
      name
      ) VALUES(?)",
      row["name"]
      )
  end
end 