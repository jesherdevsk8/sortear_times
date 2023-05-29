# frozen_string_literal: true

require 'spec_helper'
require './app/model/player'

set :environment, :test

RSpec.describe Player do
  context 'with valid player' do
    let(:player) do
      described_class.new(
        name: 'Edson Arantes do Nascimento',
        nickname: 'Pelé',
        shirt_number: '10',
        active: true,
        score_goal: '1283',
        goalkeeper: false
      )
    end

    it { expect(player.nickname).to eq('Pelé') }
  end
end
