require_relative './config/environment'

def start
    current_user = User.create(name: "Randy")
    cli = Cli.new

    beer_name = cli.prompt_for_beer_name
    beer_info = Beer.get_beer_info_by_name(beer_name)
    cli.display_beer_info(beer_info)

    review_hash = cli.prompt_for_review
    review_hash[:user_id] = current_user.id
    review_hash[:beer_id] = Beer.find_by(name: beer_name).id
    new_review = Review.create(review_hash)
    start
end

start

# binding.pry


