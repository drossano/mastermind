class ComputerCodebreaker
  def initialize
    @code_list = (1..6).to_a.repeated_permutation(4).to_a
  end

  def computer_guess
    guess = [1, 1, 2, 2]
  end
end
