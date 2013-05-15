module PruebaPadrino
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions
  	
		get '/' do
	    session[:segundos] = Time.now
      session[:cantidad_de_aciertos] = 0
		  session[:feedback] = ''
		  redirect '/resolver'
		end

		get '/resolver' do
		  session[:random1] = Random.rand(1...1000)
		  session[:random2] = Random.rand(1...1000)
 			@tiempo = session[:segundos].sec
			@feedback = session[:feedback]
			@cantidad_de_aciertos = session[:cantidad_de_aciertos]
		  @random1 = session[:random1]
		  @random2 = session[:random2]
		  erb:index
		end

		post '/respuesta' do
		  
		  resultado = params[:resultado] 

		  if((session[:random1] + session[:random2]) == resultado.to_i) 				
				session[:cantidad_de_aciertos] = session[:cantidad_de_aciertos] + 1
		    session[:feedback] = 'Acierto!'
		  else
		    session[:feedback] = 'Intentalo de Nuevo!'
		  end
		  
		  redirect '/resolver'

		end
  end
end
