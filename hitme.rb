# My first stab at building a ruby program from scratch.  Blackjack.  You better get back, jack.


puts "what is your name?"
name = gets.chomp

puts "Hey there, #{name}! Would you like to play a game of blackjack? Enter Yes or No"
play = gets.chomp.downcase
if play == "yes"

elsif play == "no"
  puts "That's OK. I was going to take all of your money anyway. Come back when you're ready to lose, sucker."
else
  puts "Sorry, but what? Please type and enter YES to play or NO to to quit"
  play2 = gets.chomp.downcase
  if play2 == "yes"
  end
end

# suits = %w(H D S C)
# cards = %w(2, 3, 4, 5, 6, 7, 8, 8, 10, J, Q, K, A)
# deck = []

#suits.each do |suit|
#  cards.each do |card|
#    deck << [suit, card]
#  end
# end

deck = ((2..11).to_a+[10]*3)*4
deck.shuffle!

player_hand = Array.new
dealer_hand = Array.new


2.times do
  player_hand << deck.pop
  dealer_hand << deck.pop
end

puts ""


puts "Ok, let's get started.  Your first two cards have face values of #{player_hand} for a total of #{player_hand.inject(:+)}"

puts ""

puts "The dealer has a hand of #{dealer_hand.inject(:+)}."

puts ""

if player_hand.inject(:+) < 21
  puts "Would #{name} like to hit? Press 'Return' to hit or any other key to stay."
  hit = gets.chomp
end

if hit == ""
  player_hand << deck.pop
  puts "Your new total is #{player_hand.inject(:+)}"

else
  puts "You stayed and your total is #{player_hand.inject(:+)}"

end

if dealer_hand.inject(:+) < 17
  dealer_hand << deck.pop
  puts "The dealer hit and the new dealer total is #{dealer_hand.inject(:+)}"
end

if player_hand.inject(:+) == dealer_hand.inject(:+)
  puts "#{name}, you and dealer both got #{player_hand.inject(:+)}. It's a draw..."
  exit

elsif dealer_hand.inject(:+) < player_hand.inject(:+) || dealer_hand.inject(:+) > 21
  puts "The dealer has #{dealer_hand.inject(:+)} and #{name} has #{player_hand.inject(:+)}"


else
  player_hand.inject(:+) < dealer_hand.inject(:+) || player_hand.inject(:+) > 21
  puts "The dealer has #{dealer_hand.inject(:+)} and #{name} have #{player_hand.inject(:+)}, so you lose"

end

