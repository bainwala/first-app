
class HomeController < ApplicationController 

  def first
    session[:playerCount] ||=0
    session[:dealerCount] ||=0
    session[:initial] ||= 0 
    @@check = session[:initial]
    if @@check == 0
      deck_id
      initial_table
    end
    if @@check == 2
      if session[:playerCount] > session[:dealerCount]
        @@message_value = "YOU DOUBLED UP!"
      elsif session[:dealerCount] > session[:playerCount]
        @@message_value = "YOU LOST!"
      else
        @@message_value = "TAKE YOUR MONEY BACK!"
      end
    end
    @message = @@message_value
    @player_count = session[:playerCount]
    @dealer_count = session[:dealerCount]
    @cards_dealer = @@card_dealer_json
    @cards_player = @@card_player_json
  end

  def second
  end

  def third
    @users = UserDetail.all
  end

  def new 
    @user = UserDetail.new
  end

  def create
    @user = UserDetail.create(params.require(:user_detail).permit(:name, :username))
    redirect_to root_path
  end

  def reset
    reset_session
    redirect_to root_path
  end

  def start_dealer
    while session[:dealerCount] < 17
      get_dealer_card
      get_dealer_count
    end
    session[:initial]+=1
    redirect_to root_path
  end

  
  def hit
    if session[:playerCount] > 21
      @@message_value = "BUSTED"
    else
      get_card
      get_player_count
    end
    redirect_to root_path
  end

  private
  def deck_id
    @res = RestClient.get 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
    @@data = JSON.parse @res
  end

  private 
  def initial_table
    @@message_value = ""
    card_dealer = RestClient.get "https://deckofcardsapi.com/api/deck/#{@@data["deck_id"]}/draw/?count=1"
    card_player = RestClient.get "https://deckofcardsapi.com/api/deck/#{@@data["deck_id"]}/draw/?count=2"
    dealer_json = JSON.parse card_dealer
    @@card_dealer_json = dealer_json["cards"]
    player_json = JSON.parse card_player
    @@card_player_json = player_json["cards"]
    get_player_count
    get_dealer_count
    session[:initial]+=1
    puts @@card_player_json
  end

  private
  def get_card
    new_card = RestClient.get "https://deckofcardsapi.com/api/deck/#{@@data["deck_id"]}/draw/?count=1"
    new_card_json = JSON.parse new_card
    new_card = new_card_json["cards"][0]
    @@card_player_json.push(new_card)
  end

  private
  def get_dealer_card
    new_card = RestClient.get "https://deckofcardsapi.com/api/deck/#{@@data["deck_id"]}/draw/?count=1"
    new_card_json = JSON.parse new_card
    new_card = new_card_json["cards"][0]
    @@card_dealer_json.push(new_card)
  end

  private 
  def get_dealer_count
    session[:dealerCount] = 0
    @@card_dealer_json.each do |item|
      if item["value"] == "JACK"
        session[:dealerCount] += 10
      elsif item["value"] == "KING"
        session[:dealerCount] += 10
      elsif item["value"] == "QUEEN"
        session[:dealerCount] += 10
      elsif item["value"] == "ACE"
        session[:dealerCount] += 1
      else
      session[:dealerCount]+= item["value"].to_i
      end
    end
  end

  private 
  def get_player_count
    session[:playerCount] = 0
    @@card_player_json.each do |item|
      if item["value"] == "JACK"
        session[:playerCount] += 10
      elsif item["value"] == "KING"
        session[:playerCount] += 10
      elsif item["value"] == "QUEEN"
        session[:playerCount] += 10
      elsif item["value"] == "ACE"
        session[:playerCount] += 1
      else
      session[:playerCount]+= item["value"].to_i
      end
    end
  end
end
