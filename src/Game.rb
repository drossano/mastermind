require_relative "Codebreaker"
require_relative "Codemaker"

class Game
  def initialize
    @code = Codemaker.new
    print @code.code
  end

  def guess
    guess = Codebreaker.new
    if guess.guess == @code.code
      p "You got it right!"
    else
      p "You're wrong!"
    end
  end
end

game = Game.new
game.guess
