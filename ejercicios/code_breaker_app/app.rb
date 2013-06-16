require 'sinatra/base'
require_relative 'code_breaker'
require_relative 'code_breaker_exceptions'

class App < Sinatra::Base
  enable :sessions
 
  get '/' do
    CodeBreaker.check_date('2013-01.01')
		CodeBreaker.check_date('hola')
  end

  get '/juego' do
    @code_breaker = session[:code_breaker]
    @intento = session[:intento]
    @fin_de_juego = session[:fin_de_juego]
    erb:index
  end 

  post '/adivinar' do
    
    letra = params[:letra] 

    if(session[:code_breaker].guess(letra))
      session[:intento] = 'acierto!'
    else
      session[:intento] = 'ups!'
    end

    if(session[:code_breaker].perdiste)
      session[:fin_de_juego] = 'Juego terminado, perdiste!'
    end
    
    if(session[:code_breaker].ganaste)
      session[:fin_de_juego] = 'Juego terminado, ganaste!'
    end  
    
    redirect '/juego'

  end
end
