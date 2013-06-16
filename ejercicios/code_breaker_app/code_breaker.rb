require_relative 'code_breaker_exceptions'

class CodeBreaker

  def initialize(code)
    @code = code
    @life = 3
    @found_code = Array.new
    code.each_char do    	
      @found_code << "*" 
    end
  end

  attr_accessor :life
  attr_reader :code

  def found_code
    @found_code.join("")
  end

	def self.check_date(date)  
		return ((ParseDate.parsedate date)[0] != nil &&(ParseDate.parsedate date)[1] != nil && (ParseDate.parsedate date)[2] != nil)
  end

  def found_code=(code)
    @found_code = code
  end

  def ganaste
    found_code.downcase == code.downcase
  end

  def perdiste
    life == 0
  end

  def guess(letter)
    if(ganaste || perdiste)
      raise CodeBreakerException::TheGameIsOvah
    end
    lower_case_letter = letter.downcase
    lower_case_code = code.downcase

    if(lower_case_code.include?(lower_case_letter))
      add_letter_to_found_code(letter)
      return true
    else  
      @life -= 1
      return false
    end
  end

  def add_letter_to_found_code(letter)       
    index = 0
    found_code_to_modify = @found_code
    
    code.each_char do |char|
      if(char.downcase == letter.downcase)
        found_code_to_modify[index] = letter
      end
      index += 1
    end
    found_code=(found_code_to_modify)    
  end
end
