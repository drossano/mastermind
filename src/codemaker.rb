class Codemaker
  attr_reader :code

  def player_code
    puts "Enter 4 digits ranging from 1 to 6 to create the code"
    code = gets.chomp.to_s.split("").map{ |digit| digit.to_i}
    loop do
      if code.all? { |digit| digit.between?(1,6)} && code.length == 4
        break
      else
        puts "Invalid code entered. Please enter 4 digits ranging from 1 to 6."
        code = gets.chomp.to_s.split("").map{ |digit| digit.to_i}
      end
    end
    code
  end

  def computer_code
    code = [rand(1..6),rand(1..6), rand(1..6), rand(1..6)]
    code
  end
end
