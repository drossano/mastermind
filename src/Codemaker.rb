class Codemaker
  def initialize
    @code = [rand(1..6),rand(1..6), rand(1..6), rand(1..6)].join.to_i
    p @code
  end
end
