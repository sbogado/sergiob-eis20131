require 'rspec'
require './code_breaker.rb'

describe CodeBreaker do
 
  @code_breaker

  attr_reader :code_breaker

  before(:each) do
    @code_breaker = CodeBreaker.new('Papas')
  end

  describe 'guess' do

    it ' when the game starts, life should be 5 ' do

      code_breaker.life.should eq code_breaker.life.should

    end
  end

  describe 'guess' do

    it ' when the game starts, found_code should be _____ ' do

      code_breaker.found_code.should eq '_____'

    end
  end

  describe 'guess' do

    it ' when fail, should decrement life ' do

      initial_life = code_breaker.life

      code_breaker.guess('c')

      code_breaker.life.should eq initial_life-1

    end
  end

  describe 'guess' do

    it ' when fail, found code should be the same' do

      initial_found_code = code_breaker.found_code

      code_breaker.guess('c')

      code_breaker.found_code.should eq initial_found_code

    end
  end


  describe 'guess' do

    it 'when success, life should be the same ' do

      initial_life = code_breaker.life

      code_breaker.guess('s')

      code_breaker.life.should eq initial_life

    end
  end

  describe 'guess' do

    it 'when success, the found code should be ____s' do

      code_breaker.guess('s')

      code_breaker.found_code.should eq '____s'

    end
  end

  describe 'guess' do

    it 'when success, the found code should be p_p__' do

      code_breaker.guess('p')

      code_breaker.found_code.should eq 'p_p__'

    end
  end

  describe 'guess' do

    it 'when success, the found code should be papa_' do

      code_breaker.guess('a')

      code_breaker.guess('p')

      code_breaker.found_code.should eq 'papa_'

    end
  end

  describe 'guess' do

    it 'when do something and the game finished, life should be the same ' do

      initial_life = code_breaker.life
      code_breaker.guess('p')
      code_breaker.guess('a')

      code_breaker.guess('p')

      code_breaker.life.should eq initial_life


    end
  end

  describe 'guess' do

    it 'when do something and the game finished, the found code should be the same' do

      code_breaker.guess('p')
      code_breaker.guess('a')
      initial_found_code = code_breaker.found_code

      code_breaker.guess('p')

      code_breaker.found_code.should eq initial_found_code

    end
  end
end
