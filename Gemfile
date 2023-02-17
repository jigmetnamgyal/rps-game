# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.2'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'graphql'
gem 'faraday'

group :development, :test do
  gem 'pry'
end

group :development do
  gem 'rspec-rails'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end
