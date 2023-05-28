# frozen_string_literal: true

require './app/usecases/players/show'
require './app/usecases/players/create'

class PlayersController
  def self.index
    Players::Show.call
  end

  def self.create(params)
    Players::Create.new(params:).call
  end
end
