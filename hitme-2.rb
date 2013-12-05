# My first stab at building a ruby program from scratch.  Blackjack.  You better get back, jack.

puts "=> Welcome to Ruby Casino.  Let's play Blackjack."
puts ""
puts "what is your name?"
name = gets.chomp

puts "Hey there, #{name}! Would you like to play a game of blackjack? Enter Yes or No"
play = gets.chomp.downcase
if play == "yes"

elsif play == "no"
  puts "That's OK. I was going to take all of your money anyway. Come back when you're ready to lose, sucker."
 puts "Sorry, but what? Please type and enter YES to play or NO to to quit"
  play2 = gets.chomp.downcase
  if play2 == "yes"
  end
end

def calculate_total(cards)
  arr = cards.map { |e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  arr.select { |e| e== "A" }.count.times do
    if total -=10
      total > 21
    end
  end

  total
end

suits = %w(H D S C)
cards = %w(2, 3, 4, 5, 6, 7, 8, 8, 10, J, Q, K, A)
deck = suits.product(cards)

deck.shuffle!

player_hand = Array.new
dealer_hand = Array.new

2.times do
  player_hand << deck.pop
  dealer_hand << deck.pop
end

player_total = calculate_total(player_hand)
dealer_total = calculate_total(dealer_hand)

puts "Dealer has #{dealer_hand[0]} and #{dealer_hand[1]} for a total of #{dealer_total}."
puts "#{name} has #{player_hand[0]} and #{player_hand[1]} for a total of #{player_total}."

if player_total == 21
  puts "You hit Blackjack! You win"
  exit
end

while player_total < 21
  puts "What would you like to do 1) for Hit or 2) to Stay?"
  hit_or_stay = gets.chomp

  if !["1", "2"].include?(hit_or_stay)
    puts "I don't understand.  Please enter 1 to hit or 2 to stay."
    next
  end

  if hit_or_stay == "2"
    puts "You chose to stay"
    break
  end

  new_card = deck.pop
  puts "#{name}, you were dealt #{new_card}"
  player_hand << new_card
  player_total = calculate_total(player_hand)
  puts "Your new total is #{player_total}"

  if player_total == 21
    puts "Congratulations! You hit Blackjack and you win."
    exit

  elsif player_total > 21
    puts "I'm sorry #{name}. You busted.  Better luck next time."
    exit
  end
end

if dealer_total == 21
  puts "The dealer has Blackjack.  You lose.  Better luck next time."
  exit
end

while dealer_total < 17
  new_card = deck.pop
  puts "The dealer draws #{new_card}."
  dealer_hand << new_card
  dealer_total = calculate_total(dealer_hand)
  puts "The dealer now has #{dealer_total}"

  if dealer_total == 21
    puts "The dealer has Blackjack.  You lose.  Better luck next time."
    exit
  elsif dealer_total > 21
    puts "The dealer busts! You win."
    exit
  end

end
puts ""
puts "Dealer cards: (total of #{dealer_total}) "
dealer_hand.each do |card|
  puts "=> #{card}"
end
puts ""
puts "#{name}'s cards: (total of #{player_total}) "
player_hand.each do |card|
  puts "=> #{card}"
end
puts ""

if dealer_total > player_total
  puts "The Dealer wins"
elsif dealer_total < player_total
  puts "You win!"
else
  puts "It's a draw."
end

