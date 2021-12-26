require_relative "GuessCheck"

class ComputerCodebreaker
  def initialize
    @code_list = (1..6).to_a.repeated_permutation(4).to_a
    @code_list.delete([1, 1, 2, 2])
    @check = GuessCheck.new
  end

  def computer_guess
  end

  def code_solver(guess, correct_numbers, correct_positions = 0)
    @code_list = @code_list.reject { |code| correct_numbers == @check.check_numbers(guess,code)}
    @code_list = @code_list.reject { |code| correct_numbers == @check.check_position(guess,code)}
    p @code_list.count
  end
end
