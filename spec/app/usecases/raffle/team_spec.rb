# frozen_string_literal: true

require 'pry-byebug'
require 'spec_helper'
require './app/usecases/raffles/team'
require 'rake'

# RACK_ENV=test bundle exec rspec ./spec/app/usecases/raffle/team_spec.rb
RSpec.describe Raffle::Team do
  before do
    Rake.application = Rake::Application.new
    Rake.application.load_rakefile

    Rake::Task['dev:add_goalkeeper'].invoke
    Rake::Task['dev:add_player'].invoke
  end

  context 'with raffled team' do
    it 'raffles team' do
      expect(described_class.call).to include(Array)
    end
  end
end
