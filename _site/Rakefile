require 'rake'
require 'yaml'

CONFIG = YAML.load(File.read('_config.yml'))
puts CONFIG

task :build do
  puts "Building..."
  sh "bundle exec jekyll build"
end

task :serve do
  puts "Serving..."
end
