# frozen_string_literal: true

require 'pry-byebug'
require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'

require './app/adapters/controllers/players_controller'
require './app/adapters/controllers/raffles_controller'

set :views, File.expand_path('app/views', __dir__)

# Root route
get '/' do
  @players = PlayersController.show
  erb :'players/index'
end

get '/randomize' do
  @teams = RafflesController.raffle&.flatten
  erb :'players/teams'
end

post '/players' do
  { result: PlayersController.create(params) }.to_json
end

get '/players' do
  { result: PlayersController.index }.to_json
end

get '/raffle' do
  { result: RafflesController.raffle }.to_json
end
