# frozen_string_literal: true

require './app/model/player'
require './app/adapters/repositories/player_repository'

module Players
  class Show
    def self.call
      Player.where(status: Player::STATUS[0]).order(:position)
    end
  end
end
