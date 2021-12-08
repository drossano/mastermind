require_relative "Codebreaker"
require_relative "Codemaker"
require_relative "GuessCheck"

class Game
  def initialize
    @code = Codemaker.new
    print @code.code
  end

  def guess
    guess = Codebreaker.new
    check = GuessCheck.new
    p "You guessed #{check.check_numbers(guess.guess,@code.code)} numbers correctly and " \
    "#{check.check_position(guess.guess,@code.code)} are in the correct position."
  end
end

game = Game.new
game.guess
