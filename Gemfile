source "https://rubygems.org"

ruby "3.3.11"

gem "rails", "~> 7.1.0"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 6.0"
gem "sprockets-rails"
gem "view_component", "~> 3.0"
gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 6.0"
  gem "capybara"
end

group :test do
  gem "axe-core-rspec", "~> 4.8"
end

group :development do
  gem "web-console"
end
