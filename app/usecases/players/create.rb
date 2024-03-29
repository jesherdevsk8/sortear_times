# frozen_string_literal: true

require './app/model/player'
require './app/adapters/repositories/player_repository'

module Players
  class Create
    def initialize(params:, player: Player, player_repository: PlayerRepository)
      @params = params
      @player = player
      @player_repository = player_repository
    end

    def call
      player = @player.new(
        name: @params[:name],
        nickname: @params[:nickname],
        shirt_number: @params[:shirt_number],
        status: @params[:status],
        score_goal: @params[:score_goal],
        position: @params[:position]
      )

      @player_repository.find_or_create_by(
        name: player.name,
        nickname: player.nickname,
        shirt_number: player.shirt_number,
        status: player.status,
        score_goal: player.score_goal,
        position: player.position
      )
    end
  end
end
