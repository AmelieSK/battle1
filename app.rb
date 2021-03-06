require 'sinatra/base'
require './lib/player.rb'

class Battle < Sinatra::Base #battle will take all design from Sinatra::Base
  enable :sessions

  get '/' do
    'Testing infrastructure working!'
  end
  get '/names' do
    erb(:index)
  end
  post '/names' do
    $player_1 = Player.new(params[:player_1_name])
    $player_2 = Player.new(params[:player_2_name])
    redirect '/play'
  end
  get '/play' do
    @player_1_name = $player_1.name
    @player_2_name = $player_2.name
    erb(:play)
  end

  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    @player_1.attack(@player_2)
    erb(:attack)
  end

  run! if app_file == $0
end
