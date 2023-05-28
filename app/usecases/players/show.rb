# frozen_string_literal: true

require './app/model/player'
require './app/adapters/repositories/player_repository'

module Players
  class Show
    def self.call
      Player.order(:name, :desc)
    end
  end
end
