# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'sinatra'
gem 'activerecord', require: 'active_record'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'rake'
gem 'thin'
gem 'require_all'
gem 'bcrypt'
gem 'rack-flash3'

gem 'shotgun'
gem 'pry'
gem 'tux'

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg', '~> 0.18'
end
