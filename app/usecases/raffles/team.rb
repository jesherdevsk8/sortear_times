# frozen_string_literal: true

require 'pry-byebug'
require 'httparty'
require 'dotenv/load'
require './app/model/player'
require './app/adapters/repositories/player_repository'

module Raffle
  class Team
    def self.call
      linha = []
      goleiro = []
      Player.where(status: 'titular', position: 'goleiro').each { |g| goleiro << g.nickname }
      Player.where(status: 'titular', position: 'linha').each { |g| linha << g.nickname }
      sortear(goleiro, linha) unless goleiro.empty? || linha.empty?
    end

    def self.sortear(goleiros, jogadores_linha)
      @time_azul = (goleiros.sample(goleiros.length - 1) + jogadores_linha.sample(jogadores_linha.length - 5))
      @time_preto = []
      goleiros.each { |nome| @time_preto << nome unless @time_azul.include?(nome) }

      jogadores_linha.each do |nome|
        next if @time_preto.length == 6

        @time_preto << nome unless @time_azul.include?(nome)
      end

      [
        ['time-preto': @time_preto],
        ['time-azul': @time_azul]
      ]
    end
  end
end
