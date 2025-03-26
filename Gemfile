source "https://rubygems.org"

# Rails version
gem "rails", "~> 7.2.2", ">= 7.2.2.1"

# Asset pipeline
gem "sprockets-rails"

# Database (sqlite3)
gem "sqlite3", ">= 1.4"

# Web server
gem "puma", ">= 5.0"

# JSON API Builder
gem "jbuilder"

# Active Storage image processing
# gem "image_processing", "~> 1.2"

# Redis (for Action Cable in production)
# gem "redis", ">= 4.0.1"
# gem "kredis"

# Timezone support for Windows and JRuby
gem "tzinfo-data", platforms: %i[windows jruby]

# Reduces boot times through caching
gem "bootsnap", require: false

# External HTTP requests
gem "httparty", "~> 0.18.1"

# Front-end dependencies
gem "bootstrap", '~> 5.3', '>= 5.3.3'
gem "jquery-rails"
gem "sassc-rails"
gem "dartsass-rails"
gem "cssbundling-rails"

# Configuration management
gem "figaro", "~> 1.2"

# Grouped Gems for Development and Test Environments
group :development, :test do
  # Debugging in development (Rails console)
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"

  # Static analysis for security vulnerabilities
  gem "brakeman", require: false

  # Ruby styling and linting
  gem "rubocop-rails-omakase", require: false

  # Testing libraries
  gem "rspec-rails"
  gem "pry"
  gem "capybara"
  gem "selenium-webdriver"
  gem "vcr"
  gem "webmock"
  gem "rails-controller-testing"
end

# Development only gems (console and error highlighting)
group :development do
  # Use console on exception pages
  gem "web-console"

  # Fine-grained error highlighting
  # gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end

# Test only gems (system testing)
group :test do
  # Use system testing
  # gem "capybara" # Already included in development/test
  # gem "selenium-webdriver" # Already included in development/test
  # gem 'vcr' # Already included in development/test
  # gem 'webmock' # Already included in development/test
end
