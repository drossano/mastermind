require_relative "Codebreaker"
require_relative "Codemaker"

class GuessCheck
  def check_numbers(guess,code)
    correct_numbers = 4-(guess-code).length
    if correct_numbers == 0
      "no"
    else
      correct_numbers
    end
  end
  
  def check_position(guess,code)
    correct_positions = guess.zip(code).count { |guess,code| guess == code }
    if correct_positions == 0
      "none"
    else
      correct_positions
    end
  end
end