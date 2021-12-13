require_relative 'Game'

class ComputerCodebreaker
  def initialize
    @code_list = (1..6).to_a.repeated_permutation(4).to_a
    p @code_list
  end
end
