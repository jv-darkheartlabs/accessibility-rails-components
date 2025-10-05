source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby ">= 3.2.0"

# Core Rails
gem "rails", "~> 7.1.0"

# Database
gem "sqlite3", "~> 1.4"

# Assets and JavaScript
gem "sprockets-rails", ">= 3.4.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"

# View Components
gem "view_component", "~> 3.0"

# Styling
gem "tailwindcss-rails", "~> 2.0"

# Accessibility Testing
gem "axe-core-rspec", "~> 4.8"

# Development and Testing
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 6.0"
  gem "factory_bot_rails"
  gem "capybara"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console"
  gem "standard", "~> 1.0"
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

# Production
group :production do
  gem "pg", "~> 1.1"
end