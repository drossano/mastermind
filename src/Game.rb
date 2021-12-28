require_relative "PlayerCodemaker"
require_relative "ComputerCodebreaker"
require_relative "PlayerCodebreaker"
require_relative "ComputerCodemaker"
require_relative "GuessCheck"
require_relative "GameType"
require_relative "Codebreaker"

class Game
  def initialize
    @game_type = GameType.new
    if @game_type.game_type == 1
      @code = PlayerCodemaker.new.code
      @computer = Codebreaker.new
    else
      @code = ComputerCodemaker.new.code
    end
  end

  def player_guess
    guess = PlayerCodebreaker.new.guess
    check = GuessCheck.new
    correct_numbers = check.check_numbers(guess, @code)
    correct_positions = check.check_position(guess, @code)

    if correct_positions == 4
      puts "#{@game_type.player_name} got the code right!"
      true
    elsif correct_numbers == 0
      puts "#{@game_type.player_name} guessed #{correct_numbers} numbers correctly."
    else
      puts "#{@game_type.player_name} guessed #{correct_numbers} numbers correctly and " \
      "#{correct_positions} #{check.position_plurality(correct_positions)} in the correct position."
    end
  end

  def computer_guess(guess)
    puts "#{@game_type.player_name} guessed #{guess.join("")}"
    check = GuessCheck.new
    correct_numbers = check.check_numbers(guess, @code)
    correct_positions = check.check_position(guess, @code)

    if correct_positions == 4
      puts "#{@game_type.player_name} got the code right!"
      true
    elsif correct_numbers == 0
      puts "#{@game_type.player_name} #{correct_numbers} numbers correctly."
      @computer.code_solver(guess, correct_numbers, 0)
    else
      puts "#{@game_type.player_name} #{correct_numbers} numbers correctly and " \
      "#{correct_positions} #{check.position_plurality(correct_positions)} in the correct position."
      @computer.code_solver(guess, correct_numbers,correct_positions)
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
        break if computer_guess(guess) == true
      elsif @game_type.game_type == 2
        break if player_guess == true
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
