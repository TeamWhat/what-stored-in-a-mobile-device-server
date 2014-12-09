source 'https://rubygems.org'

gem 'rails', '~> 4.1.8'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.6.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 3.1.2'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.2.5'

# Server
gem 'puma', '~> 2.10.2'

# CSS Framework
gem 'bootstrap-sass', '~> 3.3.1.0'

# Load enviroment variables
gem 'dotenv-rails', '~> 1.0.2'

# Authentication
gem 'devise', '~> 3.4.1'

# Visualization
gem 'chartkick', '~> 1.3.2'

group :production do
  gem 'pg', '~> 0.17.1'
  gem 'rails_12factor', '~> 0.0.2'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'sqlite3', '~> 1.3.9'
  gem 'byebug', '~> 3.5.1'
end

group :development do
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 1.2.0'
  gem 'rails_layout', '~> 1.0.24'
  gem 'better_errors', '~> 2.0.0'
  gem 'binding_of_caller', '~> 0.7.2'
end

group :test do
  gem 'rspec-activemodel-mocks', '~> 1.0.1'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'capybara', '~> 2.4.3'
  gem 'launchy', '~> 2.4.2'
  gem 'cucumber-rails', '~> 1.4.1', require: false
  gem 'database_cleaner', '~> 1.3.0'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0'
end
