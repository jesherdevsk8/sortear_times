# frozen_string_literal: true

require 'spec_helper'
require './app/usecases/players/create'

RSpec.describe Players::Create do
  context 'with new user' do
    let(:create_player) do
      described_class.new(params: {
        name: 'Eduardo Duarte',
        nickname: 'Dog Bomba',
        shirt_number: '8',
        status: 'titular',
        score_goal: '10',
        position: 'linha'
      })
    end

    it { expect(create_player.call.class).to be(PlayerRepository) }
  end
end
