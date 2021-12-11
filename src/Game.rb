require_relative "PlayerCodebreaker"
require_relative "ComputerCodemaker"
require_relative "GuessCheck"
require_relative "GameType"

class Game
  def initialize
    @game_type = GameType.new.game_type
    if @game_type == 1
      @code = PlayerCodemaker.new.code
    else
      @code = ComputerCodemaker.new.code
    end
  end

  def guess
    guess = PlayerCodebreaker.new.guess
    check = GuessCheck.new
    correct_numbers = check.check_numbers(guess,@code)
    correct_positions = check.check_position(guess,@code)

    if correct_positions == 4
      puts "You got the code right!"
      true
    elsif correct_numbers == 0
      puts "You guessed #{correct_numbers} numbers correctly."
    else
      puts "You guessed #{correct_numbers} numbers correctly and " \
      "#{correct_positions} #{check.position_plurality(correct_positions)} in the correct position."
    end
  end

  def turns
    i = 1
    max_turns = 12
    until i > max_turns
      puts "Turn #{i} of 12"
      break if guess == true

      i += 1
    end
  end
end

game = Game.new
game.turns
