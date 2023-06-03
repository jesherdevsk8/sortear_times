# frozen_string_literal: true

require './app'
require './app/model/player'
require 'httparty'
require 'dotenv/load'
require 'pry-byebug'

# rake sortear:time
namespace :sortear do
  desc 'Sortear times'
  task time: 'db:environment' do
    def jogadores
      linha = []
      goleiro = []
      Player.where(status: 'titular', position: 'goleiro').each { |g| goleiro << g.nickname }
      Player.where(status: 'titular', position: 'linha').each { |g| linha << g.nickname }
      sortear(goleiro, linha)
    end

    def sortear(goleiros, jogadores_linha)
      @time_azul = (goleiros.sample(goleiros.length - 1) + jogadores_linha.sample(jogadores_linha.length - 5))
      @time_preto = []
      goleiros.each { |nome| @time_preto << nome unless @time_azul.include?(nome) }

      jogadores_linha.each do |nome|
        next if @time_preto.length == 6

        @time_preto << nome unless @time_azul.include?(nome)
      end
      times = <<~TIMES
        Time Preto: #{@time_preto.join(', ')}
        Time Azul:  #{@time_azul.join(', ')}
      TIMES
      send_message(times)
    end

    def send_message(times)
      api_key = ENV.fetch('TELEGRAM_API_KEY', nil)
      chat_id = ENV.fetch('TELEGRAM_CHAT_ID', nil)
      HTTParty.post("https://api.telegram.org/bot#{api_key}/sendMessage",
        headers: {
          'Content-Type' => 'application/json'
        },
        body: {
          chat_id:,
          text: times
        }.to_json)
    end

    jogadores
  end
end
