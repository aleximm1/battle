require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    'Hello Battle!'
  end
  run if app_file == $0

  get '/battle/add_players' do
    erb(:add_names)
  end

  post '/battle/show_players' do
    p params
    @player1 = params[:player1]
    @player2 = params[:player2]
    erb(:show_names)
  end
end
