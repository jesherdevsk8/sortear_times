# frozen_string_literal: true

class Player < ActiveRecord::Base
  validates :name, presence: true
  validates :nickname, uniqueness: true, presence: true
  validates :status, presence: true
  validates :position, presence: true

  # TODO: try add enums
  # enum status: { 'titular': 0, 'reserva': 1 }
  # enum position: { goleiro: 0, linha: 1 }
end
