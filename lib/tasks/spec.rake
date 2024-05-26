# frozen_string_literal: true

# RACK_ENV=test bundle exec rake spec:all
require 'rspec/core/rake_task'

namespace :spec do
  desc 'Run all specs'
  RSpec::Core::RakeTask.new(:all) do |t|
    t.rspec_opts = '--format documentation'
    t.pattern = 'spec/**/*_spec.rb'
  end
end

task default: 'spec:all'
