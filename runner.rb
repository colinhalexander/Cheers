require_relative './config/environment'

def start
    cli = Cli.new

    # Login Page
    cli.display_cheers_logo
    user_type = cli.prompt_for_new_or_returning_user

    if user_type == "New User"
        cli.display_cheers_logo
        username = cli.prompt_for_new_username
        current_user = User.create(name: username)
    elsif user_type == "Returning User"
        cli.display_cheers_logo
        username = cli.prompt_for_returning_username
        current_user = User.find_by(name: username)
    end

    main_menu(cli, current_user)
end

def main_menu(cli, current_user)
    cli.display_cheers_logo
    puts "#{current_user}'s HomePage"
    menu_selection = cli.main_menu_prompt

    case menu_selection
    when "Find a Beer to Review"
        current_beer = find_a_beer_by_name(cli)
        sleep(1)
        leave_a_review(cli, current_user, current_beer)
        main_menu(cli, current_user)
    when "Get a Recommendation"

    when "See My Favorites"

    when "See My Past Reviews"

    when "Log Out"
        cli.log_out
        start
    when "Exit App"
        system("clear")
        exit
    end
end

def find_a_beer_by_name(cli)
    beer_name = cli.prompt_for_beer_name
    beer = Beer.find_by(name: beer_name)
    cli.display_beer_info(beer.info_hash)
    beer
end

def leave_a_review(cli, user, beer)
    review_hash = cli.prompt_for_review
    review_hash[:user_id] = user.id
    review_hash[:beer_id] = beer.id
    new_review = Review.create(review_hash)
end

def favorite_page
    
end

start



