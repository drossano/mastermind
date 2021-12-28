class GameType
  attr_reader :game_type

  def initialize
    puts "Enter 1 if you would like to play as the Codemaker. Enter 2 if you would like to play as the Codebreaker."
    @game_type = gets.chomp.to_i
    loop do
      if @game_type == 1 || @game_type == 2
        break
      else
        puts "Invalid entry."
        puts "Enter 1 if you would like to play as the Codemaker. Enter 2 if you would like to play as the Codebreaker."
        @game_type = gets.chomp.to_i
      end
    end
  end

  def player_name
    if game_type == 1
      "The computer"
    elsif game_type == 2
      "You"
    end
  end
end
