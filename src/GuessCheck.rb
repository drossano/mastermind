require_relative "Codebreaker"
require_relative "Codemaker"

class GuessCheck
  def check_numbers(guess,code)
    p code.filter{ |i| guess.include? i}.length
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

GuessCheck.new.check_numbers([1,2,1,5], [1,1,3,4])