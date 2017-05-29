require 'rake'
require 'yaml'

CONFIG = YAML.load(File.read('_config.yml'))
CODE_BRANCH = CONFIG["code_branch"]
DEPLOY_BRANCH = CONFIG["deploy_branch"]

task :deploy do
  puts "Building..."
  puts "Token is #{ENV['GITHUB_TOKEN']}"
  sh "git checkout #{CODE_BRANCH}"
  sh "bundle exec jekyll build"

  puts "Serving..."
  sh "git config --global user.name 'Travis CI'"
  sh "git config --global user.email 'travis@travis-ci.org'"

  sh "git checkout #{DEPLOY_BRANCH}"
  sh "cp -r _site/* ."
  sh "git status"
  sh "git add ."
  sh "git commit -m 'Automatic update...'"
  sh "git push https://#{ENV['GITHUB_TOKEN']}@github.com/c-zheng/c-zheng.github.io.git #{DEPLOY_BRANCH}"
end
