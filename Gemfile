source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
#mysql for development and postgresql for test and production

group :development do
	gem 'mysql2'
end
group :test, :production do
	gem 'pg'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem "haml", ">= 3.1.6"
gem "haml-rails", ">= 0.3.4", :group => :development
gem 'bootstrap-sass', '~> 2.3.1.3'
gem 'geocoder', '~> 1.1.8'
gem 'gmaps4rails'
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
gem 'carrierwave', '~> 0.8.0'
gem 'kaminari'
gem 'spaghetti'

group :development do
	gem 'sunspot_solr'
	gem 'sunspot_with_kaminari'
	gem 'sunspot_rails', '2.0.0'
	gem 'progress_bar'

end

group :test,:production do
	gem 'thin'
end