class HomeController < ApplicationController
  def first
    numbers = Array['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
    suits = Array['CLUBS', 'SPADES', 'HEARTS', 'DIAMONDS']
    @value = Array[numbers[rand(13)], numbers[rand(13)], numbers[rand(13)], numbers[rand(13)], numbers[rand(13)]]
    @suit = Array[suits[rand(4)], suits[rand(4)], suits[rand(4)], suits[rand(4)], suits[rand(4)]]
  end

  def second
  end

  def third
  end
end
