require 'pathname'

# Just preload all of our code from the "app" directory
app_dir = File.expand_path('../../app', __FILE__)
Dir[File.join(app_dir, '**', '*.rb')].each { |f| require f }

ENV['APP_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['APP_ENV'])
