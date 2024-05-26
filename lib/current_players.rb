# frozen_string_literal: true

class CurrentPlayer
  def initialize(players: [])
    @players = players.map(&:downcase)
    @current_players = current
    update_current_player
  end

  def update_current_player
    ids = @players.map { |player| @current_players[player] }
    Player.where.not(id: ids).update_all(status: Player::STATUS[1])
    Player.where(id: ids).update_all(status: Player::STATUS[0])
  end

  private

  def current
    @current ||= Player.pluck(:nickname, :id).to_h.transform_keys(&:downcase)
  end
end

CurrentPlayer.new(
  players: %w[
    Paulão
    Jesher
    Lucas
    Paulinho
    Ana
    Emerson
    Nardim
    Mateus
    Deva
    Fernando
    Marcão
    Francisco
  ]
)
