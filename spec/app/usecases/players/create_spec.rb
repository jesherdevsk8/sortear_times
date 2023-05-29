# frozen_string_literal: true

require 'spec_helper'
require './app/usecases/players/create'

RSpec.describe Players::Create do
  context 'with new user' do
    let(:create_player) do
      described_class.new(params: {
        name: 'Edson Arantes do Nascimento',
        nickname: 'Pelé',
        shirt_number: '10',
        active: true,
        score_goal: '1283',
        goalkeeper: false
      })
    end

    it { expect(create_player.call.class).to be(PlayerRepository) }
  end
end
