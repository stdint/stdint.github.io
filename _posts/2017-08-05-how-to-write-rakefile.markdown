---
layout: post
title: "如何写Rakefile"
date: 2017-08-05 21:00:15 -0700
categories:
---
Rakefile完全使用Ruby语法，没有额外的特殊语法。

# Rake执行的path
在某个项目中的任何一个目录下下执行rake，如果当前目录下没有Rakefile，那么rake会自动向着根目录的方向去寻找Rakefile。
这样的好处是在任何文件夹下定义的一些rake模块都是以Rakefile所在的目录的路径执行的。

Make就没有这么省事了。

# 任务
- 定义一个任务：
{% highlight ruby %}
task :name #Symbol类型作为任务名
task 'name' #字符串作为任务名
task :name do |t|
...
end
task :name => :prerequisite #任务的依赖规则
task :name => [:pre1, :pre2] #多个依赖
{% endhighlight %}
- 默认任务：
可以选择某个任务作为默认任务
{% highlight ruby %}
task :default => :one
task :one => :two do
  ...
end
task :two do
  ...
end
{% endhighlight %}
- 文件任务
文件任务用于生成一些新的文件，需要使用file方法。
{% highlight ruby %}
file "filename" => [“a.o”, "b.o"] do |t|
  sh "cc -o #{t.name} #{t.prerequisites.join(' ')}"
end
{% endhighlight %}
- 文件夹任务
用于生成文件夹，可以嵌套生成。
{% highlight ruby %}
file "top/second/third"
{% endhighlight %}
- 并行任务
可以多线程并行执行依赖规则。
{% highlight ruby %}
multitask :copyfiles => [:pre1, :pre2, :pre3] do
  puts "Tasks are done!"
end
{% endhighlight %}
- 注释
{% highlight ruby %}
desc “用于注释下面的task”
task :name => [:pre1, :pre2, :pre3] do
  ...
end
{% endhighlight %}

# 命名域
为了防止任务名字打架，Rake提供了定义命名域的方法用于规避。
{% highlight ruby %}
namespace :main do
  task :a do
    ...
  end
end
{% endhighlight %}

# Clean和Clobber
Rake提供了Clean和Clobber规则用于清理build环境。
Clobber规则默认会执行Clean规则。
{% highlight ruby %}
require 'rake/clean'
{% endhighlight %}

# 一些有用的Rake命令
以下命令均可以添加额外的任务名、名字域名，来缩小打印信息范围。
- rake -T
打印任务注释（也就是desc方法定义的字符串）。
- rake -P
打印任务的依赖关系。
- rake -W
显示某个任务定义在Rakefile的哪一行，便于debug。
