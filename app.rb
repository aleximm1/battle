require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game' 

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
    $game = Game.new(Player.new(params[:player1]), Player.new(params[:player2]))
    redirect '/battle/play'
  end

  post '/battle/attack' do
    $game.attack($game.p2)
    # session['player1_attack'] = params[:player1_attack]
    redirect '/battle/play?attacked=p1attack'
  end

  get '/battle/play' do
    # @player1_attack = session['player1_attack']
    # if @player1_attack == 'Attack'
    #   calcualate_damage("p1attack")
    # end
    @attack = params[:attacked]
    erb(:play)
  end

  # def calcualate_damage(attack_type)
  #   case attack_type
  #   when "p1attack"
  #     @attack = "p1attack"
  #   end
  # end
end
