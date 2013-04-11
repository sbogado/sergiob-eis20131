class CodeBreaker

  def initialize(code)
    @code = code
    @life = 5
    @found_code = Array.new
    code.each_char do    	
      @found_code << "_" 
    end
  end

  attr_accessor :life
  attr_reader :code

  def found_code
    @found_code.join("")
  end

  def found_code=(code)
    @found_code = code
  end

  def guess(letter)
    lower_case_letter = letter.downcase
    lower_case_code = code.downcase

    if(lower_case_code.include?(lower_case_letter))
      add_letter_to_found_code(letter)
    else  
      @life -= 1
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
