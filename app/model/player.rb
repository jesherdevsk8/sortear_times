# frozen_string_literal: true

class Player < ActiveRecord::Base
  STATUS = {
    0 => 'titular',
    1 => 'reserva'
  }.freeze

  POSITION = {
    0 => 'goleiro',
    1 => 'linha'
  }.freeze

  validates :name, presence: true
  validates :nickname, uniqueness: true, presence: true
  validates :status, presence: true
  validates :position, presence: true

  before_save :slugrize_nickname

  private

  def slugrize_nickname
    self.nickname = nickname.tr(' ', '-').downcase
  end
end
