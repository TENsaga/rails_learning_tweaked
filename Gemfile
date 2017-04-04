source 'https://rubygems.org'

gem 'rails',                       '~>5.0.2'
gem 'bcrypt',                      '3.1.11'
gem 'carrierwave',                 '0.11.2'
gem 'mini_magick',                 '4.5.1'
gem 'fog',                         '1.38.0'
gem 'will_paginate',               '3.1.0'
gem 'bootstrap-will_paginate',     '0.0.10'
gem 'bootstrap-sass',              '3.3.6'
gem 'puma',                        '3.4.0'
gem 'sass-rails',                  '~>5.0.6'
gem 'uglifier',                    '3.0.0'
gem 'coffee-rails',                '4.2.1'
gem 'jquery-rails',                '4.1.1'
gem 'turbolinks',                  '5.0.1'
gem 'jbuilder',                    '2.4.1'
gem 'rubocop',                     '~>0.47.1'

group :development, :test do
  gem 'byebug',                    '9.0.0', platform: :mri
  gem 'factory_girl_rails'
  gem 'rspec-rails',               '~>3.5.2'
  gem 'sqlite3',                   '1.3.12'
end

group :development do
  gem 'listen',                    '3.0.8'
  gem 'spring',                    '1.7.2'
  gem 'spring-watcher-listen',     '2.0.0'
  gem 'spring-commands-rspec',     '~>1.0.4'
  gem 'web-console',               '3.1.1'
end

group :test do
  gem 'database_cleaner',          '~>1.5.0'
  gem 'faker',                     '~>1.7.0'
  gem 'capybara',                  '~>2.7'
  gem 'rspec-nc',		               '~>0.3.0'
  gem 'guard-rspec',               '~>4.7.3', require: false
  #gem 'guard',                    '2.13.0'
  gem 'rails-controller-testing',  '0.1.1'
end

group :production, :staging do
  gem 'pg',                        '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
