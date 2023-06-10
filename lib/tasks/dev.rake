# frozen_string_literal: true

# rake dev:add_player dev:add_goalkeeper
require './app'
require './app/model/player'

namespace :dev do
  desc 'Add players to development'
  task add_player: 'db:environment' do
    [
      { name: 'Ana Duarte', nickname: 'Ana', shirt_number: 11, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Paulo Duarte', nickname: 'Paulinho', shirt_number: 8, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Daniel Duarte', nickname: 'Daniel', shirt_number: 7, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Devair Alberto', nickname: 'Devinha', shirt_number: 10, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Eduardo Duarte', nickname: 'Pê', shirt_number: 5, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Fabio Silva', nickname: 'Fabim', shirt_number: 2, status: 'reserva', score_goal: 0, position: 'linha' },
      { name: 'Leonardo', nickname: 'Léo', shirt_number: 0, status: 'reserva', score_goal: 0, position: 'linha' },
      { name: 'Marcos Munari', nickname: 'Marcão', shirt_number: 9, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Emerson Soares', nickname: 'Emerson', shirt_number: 17, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Mateus Duarte', nickname: 'Mateus', shirt_number: 6, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Lucas Duarte', nickname: 'Lucas', shirt_number: 4, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Francisco Duarte', nickname: 'Gordo', shirt_number: 14, status: 'reserva', score_goal: 0, position: 'linha' },
      { name: 'Ronaldo Duarte', nickname: 'Nardim', shirt_number: 28, status: 'reserva', score_goal: 0, position: 'linha' },
      { name: 'Francisco', nickname: 'Francisco', shirt_number: 30, status: 'reserva', score_goal: 0, position: 'linha' },
      { name: 'Fernando Duarte', nickname: 'Fernando', shirt_number: 3, status: 'titular', score_goal: 0, position: 'linha' },
      { name: 'Wilian', nickname: 'Wilian', shirt_number: 10, status: 'reserva', score_goal: 0, position: 'linha' },
      { name: 'Lincoln Souza', nickname: 'Lincoln', shirt_number: 88, status: 'reserva', score_goal: 0, position: 'linha' },
      { name: 'Luan Henrique', nickname: 'Luan', shirt_number: 99, status: 'reserva', score_goal: 0, position: 'linha' },
      { name: 'João Gabriel', nickname: 'João', shirt_number: 20, status: 'reserva', score_goal: 0, position: 'linha' },
      { name: 'Gabriel', nickname: 'Gabriel', shirt_number: 18, status: 'reserva', score_goal: 0, position: 'linha' }
    ].each do |player|
      Player.find_or_create_by(
        name: player[:name],
        nickname: player[:nickname],
        shirt_number: player[:shirt_number],
        status: player[:status],
        score_goal: player[:score_goal],
        position: player[:position]
      )
    end
  end
end

namespace :dev do
  desc 'Add goalkeepers to development'
  task add_goalkeeper: 'db:environment' do
    [
      { name: 'Jesher Minelli', nickname: 'Jesher', shirt_number: 22, status: 'titular', score_goal: 2, position: 'goleiro' },
      { name: 'Paulo Golero', nickname: 'Paulão', shirt_number: 12, status: 'titular', score_goal: 0, position: 'goleiro' },
      { name: 'José Carlos', nickname: 'Zé Carlos', shirt_number: 44, status: 'reserva', score_goal: 0, position: 'goleiro' },
      { name: 'Gustavo', nickname: 'Gustavo', shirt_number: 1, status: 'reserva', score_goal: 0, position: 'goleiro' }
    ].each do |player|
      Player.find_or_create_by(
        name: player[:name],
        nickname: player[:nickname],
        shirt_number: player[:shirt_number],
        status: player[:status],
        score_goal: player[:score_goal],
        position: player[:position]
      )
    end
  end
end
