require_relative './config/environment'

def start
    cli = Cli.new
    
    cli.display_cheers_logo
    current_user = new_or_returning_user(cli)

    main_menu(cli, current_user)
end

def new_or_returning_user(cli)
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
end

def main_menu(cli, current_user)
    cli.display_cheers_logo
    puts "#{current_user.name}'s HomePage"
    menu_selection = cli.main_menu_prompt

    case menu_selection
    when "Find a Beer to Review"
        current_beer = find_a_beer_by_name(cli)
        sleep(1)
        leave_a_review(cli, current_user, current_beer)
        main_menu(cli, current_user)
    when "Get a Recommendation"
        recommendations_menu(cli, current_user)
    when "See My Favorites"
        favorites_page(cli, current_user)
        main_menu(cli, current_user)
    when "See My Past Reviews"
        reviews_page(cli, current_user)
        main_menu(cli, current_user)
    when "Log Out"
        cli.log_out
        start
    when "Exit App"
        cli.randy_kings_farewell
        exit
    end
end

def find_a_beer_by_name(cli)
    beer_name = cli.prompt_for_beer_name
    beer = Beer.find_by(name: beer_name)
    if beer
        cli.display_beer_info(beer.info_hash)
        beer
    else
        cli.invalid_beer_name
        sleep(2)
        find_a_beer_by_name(cli)
    end
end

def leave_a_review(cli, user, beer)
    review_hash = cli.prompt_for_review
    review_hash[:user_id] = user.id
    review_hash[:beer_id] = beer.id
    new_review = Review.create(review_hash)
end

def favorites_page(cli, current_user)
    favorites = current_user.reviews.where(is_favorite: 't').uniq
    cli.display_favorites(favorites)
    cli.return_to_main_menu
end

def reviews_page(cli, current_user)
    reviews = current_user.reviews
    cli.display_reviews(reviews)
    cli.return_to_main_menu
end

def recommendations_menu(cli, current_user)
    system("clear")
    selection = cli.recommendations_menu_prompt
    case selection 
    when "Recommend a Random Beer"
        random_beer(cli)
        after_recommendation_menu(cli, current_user)
    when "Recommend by Category"
        category = category_menu(cli)
        random_beer_by_category(cli, category)
        after_recommendation_menu(cli, current_user)
    when "Recommend by Brewery"

    when "Return to Main Menu"
        main_menu(cli, current_user)
    end
end

def random_beer(cli)
    system("clear")
    id = rand(Beer.all.count) + 1
    beer = Beer.find(id)
    cli.display_beer_info(beer.info_hash)
end

def category_menu(cli)
    system("clear")
    categories = Category.pluck(:name)
    selection = cli.prompt_for_categories(categories)
    category = Category.find_by(name: selection)
end

def random_beer_by_category(cli, category)
    beers_in_category = Beer.where(category_id: category.id)
    id = rand(beers_in_category.count)
    beer = beers_in_category[id]
    cli.display_beer_info(beer.info_hash)
end

def after_recommendation_menu(cli, current_user)
    selection = cli.prompt_after_recommendation
    case selection
    when "Return to Recommendations Menu"
        recommendations_menu(cli, current_user)
    when "Return to Main Menu"
        main_menu(cli, current_user)
    end
end

start



