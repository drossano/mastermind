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
  end

  def guess(guess)
    puts "#{@game_type.player_name} guessed #{guess.join("")}" if @game_type.game_type == 1
    check = GuessCheck.new
    correct_numbers = check.check_numbers(guess, @code)
    correct_positions = check.check_position(guess, @code)

    if correct_positions == 4
      puts "#{@game_type.player_name} got the code right!"
      true
    elsif correct_numbers == 0
      puts "#{@game_type.player_name} #{correct_numbers} numbers correctly."
      @computer.code_solver(guess, correct_numbers, 0) if @game_type.game_type == 1
    else
      puts "#{@game_type.player_name} #{correct_numbers} numbers correctly and " \
      "#{correct_positions} #{check.position_plurality(correct_positions)} in the correct position."
      @computer.code_solver(guess, correct_numbers,correct_positions) if @game_type.game_type == 1
    end
  end

  def turns
    i = 1
    max_turns = 12
    until i > max_turns
      puts "Turn #{i} of 12"
      if @game_type.game_type == 1
        if i == 1
          guess = [1, 1, 2, 2]
        else
          guess = @computer.computer_guess
        end
        break if guess(guess) == true
      elsif @game_type.game_type == 2
        guess = @player.player_guess
        break if guess(guess) == true
      end

      i += 1

    end
    if i > 12
      puts "#{@game_type.player_name} reached the maximum amount of turns. The code is #{@code.join}"
    end
  end
end

game = Game.new
game.turns
