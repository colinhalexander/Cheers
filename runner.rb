require_relative './config/environment'

def start
    cli = Cli.new

    cli.display_welcome_page
    user_type = cli.prompt_for_new_or_returning_user

    if user_type == "New User"
        username = cli.prompt_for_new_username
        current_user = User.create(name: username)
    elsif user_type == "Returning User"
        username = cli.prompt_for_returning_username
        current_user = User.find_by(name: username)
    end

    

    # beer_name = cli.prompt_for_beer_name
    # beer_info = Beer.get_beer_info_by_name(beer_name)
    # cli.display_beer_info(beer_info)

    # review_hash = cli.prompt_for_review
    # review_hash[:user_id] = current_user.id
    # review_hash[:beer_id] = Beer.find_by(name: beer_name).id
    # new_review = Review.create(review_hash)
    # start
end

start



