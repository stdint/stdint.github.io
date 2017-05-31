---
layout: post
title: "Github Pages使用第三方主题"
date: 2017-05-30 23:29:33 -0700
categories: github jekyll theme
---
第N次开博客。使用的是Github官方支持的jekyll和免费的静态域名，加上git以及markdown的加持，感觉这次说不定能写下去!（好大的一个flag......)

不过多介绍Github Pages了，[官网](github-pages)的教程很简洁明了。官方也提供了使用Jekyll搭建一个简单的静态网站的[教程](jekyll-gp-tutorial)，也是十分简单易懂。然而，官方只支持13种Jekyll主题，而且也都不是很好看。

我决定Google一下，找找看怎么使用第三方主题的方法。

我找了一个MIT license的叫whiteglass的主题，只需要在Gemfile里面加上这一句就OK啦。
```ruby
gem "jekyll-whiteglass", "1.3.0"
```

要在Github Page上应用这个主题，我是这么干的：
- 首先需要两个branch：master和develop。
- master上不要commit config.yml，用来防止Github自动帮我编译网站。
- 在develop上编译，然后把site文件夹里面的所有文件拷贝到顶层文件夹里面，在master上commit。
- 这样就搞定了......

然而这么做太烦了，手动操作太多。于是我写了个Rakefile来自动化编译过程，然后利用travis ci来自动化上面写的第三步。每次写博客，我只需要在develop上commit然后push，就搞定啦！

还不错哦。


[github-pages]: https://pages.github.com
[jekyll-gp-tutorial]: https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/
