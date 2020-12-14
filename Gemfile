source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# https://github.com/rails/rails/pull/31521
gem 'rails', '~> 5.2.4'

# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# https://guides.rubyonrails.org/upgrading_ruby_on_rails.html#upgrading-from-rails-5-1-to-rails-5-2-bootsnap
# https://github.com/rails/rails/pull/29313/files#diff-d09ea66f8227784ff4393d88a19836f321c915ae10031d16c93d67e6283ab55f
# for railties app_generator_test
gem 'bootsnap', '>= 1.1.0', require: false

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'mini_racer'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'

gem 'active_link_to'
gem 'bootstrap', '>= 4.3.1'

gem 'devise'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'kaminari'
gem 'simple_form'
gem 'slim-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.0'
  gem 'spring-commands-rspec'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rubocop', '~> 0.51.0', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'yard'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
