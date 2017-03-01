require 'sinatra/base'

class Battle < Sinatra::Base
  get '/' do
    'Hello Battle!'
    "player1 = " << session[:player1].inspect
    "player2 = " << session[:player2].inspect
  end
  run if app_file == $0

  enable :sessions

  get '/battle/add_players' do
    erb(:add_names)
  end

  # get '/:player1' do
  #   session['player1'] = params['player1']
  # end
  #
  # get '/:player2' do
  #   session['player2'] = params['player2']
  # end

  post '/battle/set_players' do
    p params
    session['player1'] = params[:player1]
    session['player2'] = params[:player2]
    redirect '/battle/show_players'
  end

  get '/battle/show_players' do
    @player1 = session['player1']
    @player2 = session['player2']
    @player2hp = "65"
    erb(:show_names)
  end
end
