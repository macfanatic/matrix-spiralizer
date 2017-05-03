require 'pathname'

# Add all subfolders of the "app" dir as paths in the load path
app_dir = File.expand_path('../../app', __FILE__)
app_directories = Pathname.new(app_dir).children.select(&:directory?)
app_directories.each do |dir|
  $LOAD_PATH.unshift(dir) unless $LOAD_PATH.include?(dir)
end

ENV['APP_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV['APP_ENV'])
