source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18.1'
gem "pg_array_parser", '~> 0.0.9'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use Haml (temporarily)
gem "haml-rails", '~> 0.8.2'
gem "erb2haml", '~> 0.1.5', :group => :development

# Use Slim for HTML
gem 'slim-rails', '~> 3.0.1'


# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Annotate models
gem 'annotate', '~> 2.6.5', group: :development

# Use rspec for testing
group :development, :test do
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'rspec-rails', '~> 3.2.0'
  gem 'guard-rspec', '~> 4.5.0'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'capybara', '~> 2.4.4'
  gem 'database_cleaner', '~> 1.4.0'
end

# Detect inefficient database queries
gem 'bullet', '~> 4.14.4', group: :development

# Better Errors
group :development do
  gem 'better_errors', '~> 2.1.1'
  gem 'binding_of_caller', '~> 0.7.2'
  gem 'meta_request', '~> 0.3.4'
  gem 'web-console', '~> 2.0'
end

# User Auth
gem 'devise', '~> 3.4.1'
gem 'omniauth', '~> 1.2.2'

group :development, :test do
  # gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  # gem 'pry-byebug'
end

# gem 'bower-rails'
gem 'tinymce-rails', '~> 4.1.6'
gem 'simple_form', '~> 3.1.0'

# Use byebug for debugging
gem 'byebug', '~> 3.5.1'

# Article slugs instead of ids
gem 'friendly_id', '~> 5.1.0'
