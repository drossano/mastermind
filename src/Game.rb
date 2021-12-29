require_relative "GuessCheck"
require_relative "GameType"
require_relative "Codebreaker"
require_relative "Codemaker"

class Game
  def initialize
    @game_type = GameType.new
    if @game_type.game_type == 1
      @code = Codemaker.new.player_code
      @computer = Codebreaker.new
    else
      @code = Codemaker.new.computer_code
      @player = Codebreaker.new
    end
    @check = GuessCheck.new
  end

  def guess(guess)
    puts "#{@game_type.player_name} guessed #{guess.join("")}" if @game_type.game_type == 1
    correct_numbers = @check.check_numbers(guess, @code)
    correct_positions = @check.check_position(guess, @code)
    if correct_positions == 4
      winner
    else
      puts number_feedback(correct_numbers) + position_feedback(correct_positions) + "."
      @computer.code_solver(guess, correct_numbers,correct_positions) if @game_type.game_type == 1
    end
  end

  def winner
    puts "#{@game_type.player_name} got the code right!"
      true
  end

  def number_feedback(correct_numbers)
    "#{@game_type.player_name} #{correct_numbers} guessed #{@check.number_plurality(correct_numbers)} correctly"
  end

  def position_feedback(correct_positions)
    " and #{correct_positions} #{@check.position_plurality(correct_positions)} in the correct position"
  end

  def turns
    i = 1
    max_turns = 12
    until i > max_turns
      puts "Turn #{i} of 12"
      if @game_type.game_type == 1
        guess = @computer.computer_guess(i)
        break if guess(guess) == true

        continue
      elsif @game_type.game_type == 2
        guess = @player.player_guess
        break if guess(guess) == true
      end
      i += 1
    end
    if i > max_turns
      puts "#{@game_type.player_name} reached the maximum amount of turns. The code is #{@code.join}"
    end
  end

  def continue
    print "Press enter to continue..."
    gets
  end
end

game = Game.new
game.turns
