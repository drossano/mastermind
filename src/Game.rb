require_relative "Codebreaker"
require_relative "Codemaker"
require_relative "GuessCheck"

class Game
  def initialize
    @code = Codemaker.new.code
    print @code
  end

  def guess
    guess = Codebreaker.new.guess
    check = GuessCheck.new
    correct_numbers = check.check_numbers(guess,@code)
    correct_positions = check.check_position(guess,@code)

    if correct_positions == 4
      puts "You got the code right!"
      true
    elsif correct_numbers != "no" || correct_positions != "none"
      puts "You guessed #{correct_numbers} numbers correctly and " \
      "#{correct_positions} #{check.position_plurality(correct_positions)} in the correct position."
    else
      puts "You guessed #{correct_numbers} numbers correctly."
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
