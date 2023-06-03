# frozen_string_literal: true

require 'spec_helper'
require './app/model/player'

set :database, { adapter: 'sqlite3', database: ENV.fetch('DB_PATH_TEST', nil) }
# RUN rake db:create db:migrate to create a db test

RSpec.describe Player do
  context 'with valid player' do
    let(:player) do
      described_class.new(
        name: 'Edson Arantes do Nascimento',
        nickname: 'Pelé',
        shirt_number: '10',
        status: 'titular',
        score_goal: '1283',
        position: 'linha'
      )
    end

    it { expect(player.nickname).to eq('Pelé') }
  end

  context 'validates presence' do
    let(:player) do
      described_class.new(
        name: '',
        nickname: 'Dog Bomba',
        shirt_number: '10',
        status: '',
        score_goal: 0,
        position: ''
      )
    end

    it 'with a invalid params' do
      player.valid?
      expect(player.errors[:name]).to include("can't be blank")
      expect(player.errors[:nickname]).to include('has already been taken')
      expect(player.errors[:status]).to include("can't be blank")
      expect(player.errors[:position]).to include("can't be blank")
      player.nickname = ''
      player.valid?
      expect(player.errors[:nickname]).to include("can't be blank")
    end
  end
end
