
class HomeController < ApplicationController 

  def first
    session[:count] ||=0
    session[:initial] ||= 0 
    @@check = session[:initial]
    if @@check == 0
      deck_id
      initial_table
    end
    @@count = session[:count]
    @count1 = @@count
    @cards_dealer = @@card_dealer_json
    @cards_player = @@card_player_json
    puts @cards_player
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

  
  def hit
    get_card
    get_count
    redirect_to root_path
  end

  private
  def deck_id
    @res = RestClient.get 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
    @@data = JSON.parse @res
  end

  private 
  def initial_table
    card_dealer = RestClient.get "https://deckofcardsapi.com/api/deck/#{@@data["deck_id"]}/draw/?count=1"
    card_player = RestClient.get "https://deckofcardsapi.com/api/deck/#{@@data["deck_id"]}/draw/?count=2"
    dealer_json = JSON.parse card_dealer
    @@card_dealer_json = dealer_json["cards"]
    player_json = JSON.parse card_player
    @@card_player_json = player_json["cards"]
    get_count
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
  def get_count
    session[:count] = 0
    @@card_player_json.each do |item|
      if item["value"] == "JACK"
        session[:count] += 10
      elsif item["value"] == "KING"
        session[:count] += 10
      elsif item["value"] == "QUEEN"
        session[:count] += 10
      elsif item["value"] == "ACE"
        session[:count] += 1
      else
      session[:count]+= item["value"].to_i
      end
    end
  end
end
