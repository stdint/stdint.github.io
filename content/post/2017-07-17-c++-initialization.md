---
layout: post
title: C++变量初始化方法
date: 2017-07-18 05:40:26 +0000
featured: true
categories:
- C++
draft: true

---
现在的C++有三种初始化变量的方法，他们分别是
- 赋值语句，也就是等号
- 小括号，其实是调用构造函数
- 花括号（C++11以后）

等号赋值是传统的C语言赋值，当变量数据类型涵盖范围较小时，有可能会丢失高位信息，造成错误。
{% highlight c++ %}
int i1 = 7.8    // i1 becomes 7(surprise?)
{% endhighlight %}

小括号等于是调用了构造函数，没有什么特别好讲的。

C++11推出了initializer list，即花括号语法。这种方法会在编译时报错（报警告）提示丢失信息的风险。
在这个语法下，等号不是必须的。
{% highlight c++ %}
int i2{7.8}    // error: float->int
int i3 = {7.8} // error: float->int, 等号不是必须的
{% endhighlight %}

总的来说，等号赋值提供了C的兼容性，但是不安全。花括号赋值是比较被推荐的做法。

* 例子来自《A Tour Of C++》