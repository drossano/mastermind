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
    p "You guessed #{correct_numbers} numbers correctly and " \
    "#{correct_positions} are in the correct position."
  end
end

game = Game.new
game.guess
