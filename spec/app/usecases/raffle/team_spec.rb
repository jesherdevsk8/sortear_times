# frozen_string_literal: true

require 'pry-byebug'
require 'spec_helper'
require './app/usecases/raffles/team'

RSpec.describe Raffle::Team do
  context 'with raffled team' do
    it 'raffles team' do
      expect(described_class.call).to include(Array)
    end
  end
end
