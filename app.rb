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

  post '/battle/set_players' do
    p params
    session['player1'] = params[:player1]
    session['player2'] = params[:player2]
    # session['player1_attack'] = params[:player1_attack]
    redirect '/battle/show_players'
  end

  post '/battle/attack' do
    session['player1_attack'] = params[:player1_attack]
    redirect '/battle/show_players'
  end

  get '/battle/show_players' do
    @player1 = session['player1']
    @player2 = session['player2']
    @player2hp = '65'
    @player1_attack = session['player1_attack']
    if @player1_attack == 'player1_attack'
      calcualate_damage("p1attack")
    end
    erb(:show_names)
  end

  def calcualate_damage(attack_type)
    case attack_type
    when "p1attack"
      @attack = "p1attack"
    end
  end
end
