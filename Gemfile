source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "byebug", platforms: %i[ mri mingw x64_mingw ]
  # Set up for development and test environments
  gem 'sqlite3', '~> 1.4'
  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'
  # To create a test
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'webdrivers'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem "spring"

  # Ruby code style checking and code formatting tool
  gem 'rubocop'
  gem 'rubocop-rails'
  # Provides a better error page
  gem 'better_errors'
  # Add a console to the error page
  gem 'binding_of_caller'
  # help to kill N+1 queries and unused eager loading
  gem 'bullet'
  # RailsAdmin is a Rails engine that provides an easy-to-use interface for managing your data
  # gem 'rails_admin'
end

# User authentication
gem 'sorcery'

# Use it to create data
gem 'faker'

# tailwind.css introduction
gem 'cssbundling-rails'
gem 'jsbundling-rails'

# image
gem 'carrierwave'
gem 'mini_magick'

# google_map_api_enviroment
gem 'dotenv-rails'

# pagination
gem 'kaminari'
