require 'rake'
require 'date'

desc "Default task is :deploy"
task :default => :deploy

task :config do
  sh "git config --global user.name 'Travis CI'"
  sh "git config --global user.email 'travis@travis-ci.org'"
end

task :build => [:config] do
  sh "git checkout develop"
  sh "bundle exec jekyll build"
end

desc "Deploy the blog"
task :deploy => [:build, :config] do
  sh "git checkout master"
  sh "cp -r _site/* ."
  sh "git add ."
  sh "git commit -q -m 'Automatic update...'"
  sh "git push -q https://#{ENV['GITHUB_TOKEN']}@github.com/stdint/stdint.github.io.git master"
end

  # adapted from https://github.com/imathis/octopress/blob/master/Rakefile   
  # usage rake new_post['My New Post'] or rake new_post (defaults to "My New Post")
  desc "Start a new post"
  task :new, :title do |t, args|
   args.with_defaults(:title => 'My New Post')
   title = args.title
   filename = "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.downcase.gsub(/&/,'and').gsub(/[,'":\?!\(\)\[\]]/,'').gsub(/[\W\.]/, '-').gsub(/-+$/,'')}.md"
   puts "Creating new post: #{filename}"
   open(filename, 'w') do |post|
     post.puts "---"
     post.puts "layout: post"
     post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
     post.puts "description: "
     post.puts "headline: "
     post.puts "modified: #{Time.now.strftime('%Y-%m-%d')}"
     post.puts "category: personal"
     post.puts "featured: true"
     post.puts "tags: []"
     post.puts "imagefeature: "
     post.puts "comments: false"
     post.puts "mathjax: "
     post.puts "---"
   end
  end

  desc "Start a new quote"
  task :newquote, :title do |t, args|
   args.with_defaults(:title => 'My New quote')
   title = args.title
   filename = "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.downcase.gsub(/&/,'and').gsub(/[,'":\?!\(\)\[\]]/,'').gsub(/[\W\.]/, '-').gsub(/-+$/,'')}.md"
   puts "Creating new post: #{filename}"
   open(filename, 'w') do |post|
     post.puts "---"
     post.puts "layout: post"
     post.puts "type: quote"
     post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
     post.puts "description: "
     post.puts "headline: "
     post.puts "modified: #{Time.now.strftime('%Y-%m-%d')}"
     post.puts "category: quotes"
     post.puts "featured: true"
     post.puts "tags: []"
     post.puts "image: "
     post.puts "  feature: "
     post.puts "comments: false"
     post.puts "mathjax: "
     post.puts "---"
   end
  end

  desc "Start a new status"
  task :newstatus, :title do |t, args|
   args.with_defaults(:title => 'My New Post')
   title = args.title
   filename = "_posts/#{Time.now.strftime('%Y-%m-%d')}-#{title.downcase.gsub(/&/,'and').gsub(/[,'":\?!\(\)\[\]]/,'').gsub(/[\W\.]/, '-').gsub(/-+$/,'')}.md"
   puts "Creating new post: #{filename}"
   open(filename, 'w') do |post|
     post.puts "---"
     post.puts "layout: post"
     post.puts "type: status"
     post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
     post.puts "description: "
     post.puts "headline: "
     post.puts "modified: #{Time.now.strftime('%Y-%m-%d')}"
     post.puts "category: status"
     post.puts "featured: true"
     post.puts "tags: []"
     post.puts "imagefeature: "
     post.puts "comments: false"
     post.puts "mathjax: "
     post.puts "---"
   end
  end

    # adapted from https://github.com/imathis/octopress/blob/master/Rakefile   
  # usage rake new_post['My New Post'] or rake new_post (defaults to "My New Post")
  desc "Start a new page"
  task :newpage, :title do |t, args|
   args.with_defaults(:title => 'My New page')
   title = args.title
   filename = "#{title.downcase.gsub(/&/,'and').gsub(/[,'":\?!\(\)\[\]]/,'').gsub(/[\W\.]/, '-').gsub(/-+$/,'')}.md"
   puts "Creating new page: #{filename}"
   open(filename, 'w') do |post|
     post.puts "---"
     post.puts "layout: page"
     post.puts "permalink: #{title.downcase.gsub(/&/,'and').gsub(/[,'":\?!\(\)\[\]]/,'').gsub(/[\W\.]/, '-').gsub(/-+$/,'')}/index.html"
     post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
     post.puts "description: "
     post.puts "headline: "
     post.puts "modified: #{Time.now.strftime('%Y-%m-%d')}"
     post.puts "tags: []"
     post.puts "imagefeature: "
     post.puts "comments: false"
     post.puts "mathjax: "
     post.puts "---"
   end
  end
