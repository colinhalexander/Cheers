require_relative './config/environment'

current_user = User.new(name: "Randy")
cli = Cli.new

beer_name = cli.prompt_for_beer_name
beer_info = Beer.get_beer_info_by_name(beer_name)
cli.display_beer_info(beer_info)
review_hash = cli.prompt_for_review
new_review = Review.new(review_hash)

binding.pry


