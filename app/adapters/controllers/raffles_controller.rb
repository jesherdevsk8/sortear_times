# frozen_string_literal: true

require 'pry-byebug'
require './app/usecases/raffles/team'

class RafflesController
  def self.raffle
    Raffle::Team.call
  end
end
