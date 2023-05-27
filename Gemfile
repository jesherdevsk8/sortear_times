# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '3.2.0'

gem 'dotenv'
gem 'httparty'
# gem 'puma'
gem 'thin'
gem 'rake'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'sqlite3'

group :test do
  gem 'rack-test'
  gem 'rspec'
end

group :development do
  gem 'pry-byebug'
  gem 'simplecov'
end
