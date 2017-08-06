require 'rake'
require 'yaml'

CONFIG = YAML.load(File.read('_config.yml'))
CODE_BRANCH = CONFIG["code_branch"]
DEPLOY_BRANCH = CONFIG["deploy_branch"]

desc "Default task is :deploy"
task :default => :deploy

task :config do
  sh "git config --global user.name 'Travis CI'"
  sh "git config --global user.email 'travis@travis-ci.org'"
end

task :build => [:config] do
  sh "git checkout #{CODE_BRANCH}"
  sh "bundle exec jekyll build"
end

desc "Deploy the blog"
task :deploy => [:build, :config] do
  sh "git checkout #{DEPLOY_BRANCH}"
  sh "cp -r _site/* ."
  sh "git add ."
  sh "git commit -q -m 'Automatic update...'"
  sh "git push -q https://#{ENV['GITHUB_TOKEN']}@github.com/c-zheng/c-zheng.github.io.git #{DEPLOY_BRANCH}"
end
