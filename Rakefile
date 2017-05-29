require 'rake'
require 'yaml'

CONFIG = YAML.load(File.read('_config.yml'))
CODE_BRANCH = CONFIG["code_branch"]
DEPLOY_BRANCH = CONFIG["deploy_branch"]

task :build do
  puts "Building..."
  sh "git checkout #{CODE_BRANCH}"
  sh "bundle exec jekyll build"
end

task :deploy do
  puts "Serving..."
  #sh "git config --global user.name 'Travis CI'"
  #sh "git config --global user.email 'travis@travis-ci.com'"
  puts "Switch to branch #{DEPLOY_BRANCH}"
  sh "git checkout #{DEPLOY_BRANCH}"
  sh "cp -r _site/ ."
  sh "git status"
  sh "git add ."
  sh "git commit -m 'Automatic update...'"
  sh "git push origin #{DEPLOY_BRANCH}"
end
