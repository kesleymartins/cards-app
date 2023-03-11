source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.1"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem 'importmap-rails', '~> 1.1', '>= 1.1.5'
gem 'turbo-rails', '~> 1.3', '>= 1.3.3'
gem 'stimulus-rails', '~> 1.2', '>= 1.2.1'
gem 'pagy', '~> 6.0', '>= 6.0.2'
gem 'devise', '~> 4.9'
gem 'enumerate_it', '~> 3.2', '>= 3.2.2'
gem 'ransack', '~> 4.0'
gem 'pundit', '~> 2.3'

group :development do
  gem 'bullet', '~> 7.0', '>= 7.0.7'
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
  gem 'fuubar', '~> 2.5', '>= 2.5.1'
end

group :test do
  gem 'shoulda-matchers', '~> 5.3'
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 6.0.0'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 3.1', '>= 3.1.1'
end
