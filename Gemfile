# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '3.2.2'

gem 'dotenv'
gem 'httparty'
gem 'rack'
gem 'rake'
gem 'sinatra'
gem 'sinatra-activerecord'
gem 'thin'

group :test do
  gem 'rack-test'
  gem 'rspec'
  gem 'sqlite3'
end

group :development do
  gem 'pg'
  gem 'pry-byebug'
end
