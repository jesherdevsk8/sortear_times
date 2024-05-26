#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra/activerecord'
require_relative '../app/usecases/players/update_current_player'

# TODO: call this on controller this on controller
Players::UpdateCurrentPlayer.new(
  players: %w[
    Paulão
    Jesher
    Lucas
    Paulinho
    Ana
    Emerson
    Nardim
    Mateus
    Devinha
    Fernando
    Marcão
    Francisco
  ]
).call
