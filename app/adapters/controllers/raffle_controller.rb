# frozen_string_literal: true

require 'pry-byebug'
require './app/usecases/raffle/team'

class PlayersController
  def self.raffle
    Raffle::Team.call
  end
end
