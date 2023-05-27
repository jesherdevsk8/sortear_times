# frozen_string_literal: true

require 'sinatra'
require 'sinatra/activerecord'
require 'dotenv/load'
require_relative './app/model/players'

# require './app/adapters/controllers/users_controllers'
# require './app/adapters/controllers/orders_controller'

set :database, { adapter: 'sqlite3', database: ENV.fetch('DB_PATH', nil) }

post '/players' do
  { result: Player.find_or_create_by(valid_params) }.to_json
end

get '/players' do
  { result: Player.order(:name, :desc) }.to_json
end

private

def valid_params
  params do
    params[:name]
    params[:nickname]
    params[:shirt_number]
    params[:active]
    params[:score_goal]
  end
end
