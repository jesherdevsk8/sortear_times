# frozen_string_literal: true

require 'spec_helper'
require './app/model/player'

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

  context 'callbacks' do
    let(:player) do
      described_class.new(
        name: 'John Doe',
        nickname: 'John Doe',
        shirt_number: '7',
        status: 'reserva',
        score_goal: 0,
        position: 'linha'
      )
    end

    it 'converts nickname to slug before saving' do
      player.save!

      expect(player.nickname).to eq('john-doe')
    end
  end
end
