require_relative "PlayerCodebreaker"
require_relative "ComputerCodemaker"
require_relative "ComputerCodebreaker"
require_relative "Codebreaker"

class GuessCheck
  def check_numbers(guess, code)
    correct_numbers = 0
    code_tally = code.tally
    guess_tally = guess.tally
    guess_tally.each do |guess_number, guess_frequency|
      code_tally.each do |code_number, code_frequency|
        if guess_number == code_number
          correct_numbers += [guess_frequency,code_frequency].min
        end
      end
    end
    return correct_numbers
  end

  def check_position(guess, code)
    correct_positions = guess.zip(code).count { |guess_number, code_number| guess_number == code_number }
    if correct_positions == 0
      "none"
    else
      correct_positions
    end
  end

  def position_plurality(correct_positions)
    if correct_positions == 1
      "is"
    else
      "are"
    end
  end
end
