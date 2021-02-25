
class HomeController < ApplicationController
  def first
    res = RestClient.get 'https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1'
    data = JSON.parse res
    card = RestClient.get "https://deckofcardsapi.com/api/deck/#{data["deck_id"]}/draw/?count=5"
    card_json = JSON.parse card
    @cards = card_json["cards"]
    puts card_json
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
end
