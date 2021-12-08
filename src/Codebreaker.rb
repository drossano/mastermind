class Codebreaker
  attr_reader :guess
  
  def initialize
    puts "Enter 4 digits ranging from 1 to 6 to guess the code"
    @guess = gets.chomp.to_s.split("").map{ |digit| digit.to_i}
    loop do      
      if @guess.all? { |digit| digit.between?(1,6)} && @guess.length == 4
        break
      else
        puts "Invalid guess entered. Please enter 4 digits ranging from 1 to 6."
        @guess = gets.chomp.to_s.split("").map{ |digit| digit.to_i}
      end
    end
  end
end

