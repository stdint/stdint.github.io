require 'rake'
require 'yaml'

CONFIG = YAML.load(File.read('_config.yml'))
CODE_BRANCH = CONFIG["code_branch"]
DEPLOY_BRANCH = CONFIG["deploy_branch"]

task :build do
  puts "Building..."
  sh "bundle exec jekyll build"
end

task :serve do
  puts "Serving..."
  #sh "git config --global user.name 'Travis CI'"
  #sh "git config --global user.email 'travis@travis-ci.com'"
  puts "Switch to branch #{DEPLOY_BRANCH}"
  sh "git checkout #{DEPLOY_BRANCH}"
  sh "cp -r _site/ ."
  sh "git status"
end
