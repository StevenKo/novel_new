source 'https://rubygems.org'
ruby '2.3.3'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'mysql2'
gem 'yaml_db'
gem 'bcrypt-ruby', '=3.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'nokogiri'
gem 'will_paginate'

gem 'elasticsearch-model', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-rails', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-persistence', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'

gem "net-ssh"
gem 'whenever', :require => false
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'
gem 'zhconv'
gem 'gcm'
# gem "skylight"
gem 'capybara'
gem 'selenium-webdriver'
gem "dalli"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
  gem 'capistrano',         require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
