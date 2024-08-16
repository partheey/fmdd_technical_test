require 'pry'
puts "\n"
puts '---------------------------'
puts "Welcome to the dice roller!"
puts '---------------------------'
puts "\n"
print "Enter the number of dice to roll: "
dice_count = gets.chomp.to_i
dices = Array.new(dice_count) { Array.new(2) }
puts "\n"
puts "Enter the number of sides for each dice below"
dice_count.times do |index|
  print "Dice #{index+1}: "
  dices[index][0] = gets.chomp.to_i
end
print "Are you ready to roll the dice? (y/n): "
response = gets.chomp
if response == 'y'
  puts "\n"
  puts "Rolling the dice..."
  dices.each.with_index(1) do |dice, index|
    dice[1] = rand(1..dice[0])
    puts "##{index}: #{dice[1]}"
  end
  total = dices.inject(0) { |sum, dice| sum + dice[1] }
  puts "Total: #{total}"
else
  puts "You have chosen not to roll the dice. Goodbye!"
end
puts "\n"
