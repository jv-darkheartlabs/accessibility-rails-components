#!/bin/bash
set -e

echo "♿ Setting up Accessibility Rails Components Codespace..."

# Wait for PostgreSQL to be ready
echo "⏳ Waiting for PostgreSQL to start..."
until pg_isready -h postgres -p 5432 -U accessibility; do
  echo "Waiting for PostgreSQL..."
  sleep 2
done
echo "✅ PostgreSQL is ready!"

# Install Ruby dependencies
echo "💎 Installing Ruby gems..."
gem install bundler
bundle install

# Create database if it doesn't exist
echo "🗄️ Setting up database..."
if bundle exec rails db:version > /dev/null 2>&1; then
  echo "Database already exists, running migrations..."
  bundle exec rails db:migrate
else
  echo "Creating database..."
  bundle exec rails db:create
  bundle exec rails db:migrate
fi

# Set up development tools
echo "🛠️ Setting up development tools..."
bundle exec rails generate rspec:install 2>/dev/null || echo "RSpec already initialized"

# Install Node dependencies and build assets
echo "📦 Installing Node.js dependencies..."
npm install

# Build CSS with Tailwind
echo "🎨 Building CSS assets..."
bundle exec rails assets:precompile 2>/dev/null || echo "Assets precompilation skipped"

# Create necessary directories
mkdir -p tmp/pids
mkdir -p log
mkdir -p public

# Set up accessibility testing tools
echo "♿ Setting up accessibility testing..."
npm install -g axe-core @axe-core/cli 2>/dev/null || echo "Axe CLI already installed"

# Install browser dependencies for testing (if Capybara is configured)
echo "🌐 Setting up browser testing..."
bundle exec rails webdrivers:chromedriver:install 2>/dev/null || echo "ChromeDriver setup skipped"

echo "✅ Accessibility Rails Components Codespace setup complete!"
echo ""
echo "🚀 Quick Start Commands:"
echo "  • Start server: bundle exec rails server -b 0.0.0.0"
echo "  • ViewComponent previews: bundle exec rails server -b 0.0.0.0 -p 3001"
echo "  • Run tests: bundle exec rspec"
echo "  • Accessibility audit: axe http://localhost:3000"
echo "  • Console: bundle exec rails console"
echo ""
echo "🔗 The app will be available at: https://[codespace-name]-3000.app.github.dev"
echo "🔗 Component previews: https://[codespace-name]-3000.app.github.dev/rails/view_components"
echo ""
echo "♿ Accessibility Features:"
echo "  • WCAG 2.1 AA compliant components"
echo "  • Screen reader support"
echo "  • Keyboard navigation"
echo "  • High contrast themes"