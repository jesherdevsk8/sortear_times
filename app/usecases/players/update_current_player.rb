# frozen_string_literal: true

require 'pry-byebug'
require './app/model/player'

module Players
  class UpdateCurrentPlayer
    def initialize(players: [])
      return unless players.is_a?(Array) && players.any?

      @players = players.map(&:downcase)
      @current_players = current
    end

    def call
      ActiveRecord::Base.transaction do
        ids = @players&.map { |player| @current_players[player] }

        return if ids.nil? || !ids.is_a?(Array)

        Player.where.not(id: ids).update_all(status: Player::STATUS[1])
        Player.where(id: ids).update_all(status: Player::STATUS[0])
      end
    end

    private

    def current
      @current ||= Player.pluck(:nickname, :id).to_h.transform_keys(&:downcase)
    end
  end
end
