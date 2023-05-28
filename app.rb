# frozen_string_literal: true

require 'pry-byebug'
require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'

require './app/adapters/controllers/players_controller'

set :database, { adapter: 'sqlite3', database: ENV.fetch('DB_PATH', nil) }

post '/players' do
  { result: PlayersController.create(params) }.to_json
end

get '/players' do
  { result: PlayersController.index }.to_json
end
