---
layout: post
title: 嵌入式系统中的存储器
date: 2017-06-08 04:08:25 +0000
featured: true
categories:
- 嵌入式

---
一般来说，嵌入式系统中常见的存储器可以分为以下几类：

1. RAM，随机存储器
2. ROM，只读存储器
3. 混合型存储器

每一类存储器根据特性还可以细分成很多不同的器件类型。下面我就说明一下每一类存储器。

# 主要特性
## RAM
可读写的存储器，存取速度快，相对造价高。
- SRAM:只要通电，数据就不会丢失
- DRAM:不论通电与否，数据生命期较短，大约4ms
- SRAM vs DRAM:SRAM存取时间比DRAM快大约4倍，但是成本远高于后者

## ROM
只读型存储器，读取速度快。
- Masked ROM:普通的只读存储器，生产时写入数据，成本低
- PROM:可编程一次，经常作为OTP器件
- EPROM:可擦除的可编程器件，一般需要强紫外光源擦除

## Hybrid
混合型存储器，混合了RAM和ROM的特点的一类器件。
- EEPROM:
  - 通过上电擦除
  - 写完数据后数据不会丢失，类似ROM
  - 和RAM相比，保存数据的操作要慢得多
  - 最小可以擦除一个字节
- Flash:
  - 集成度高，成本低，非易失，可重复编程
  - 读取速度快，存储速度慢
  - 最小擦除单元为一个sector
- NVRAM:
  - 可以看做加了电池的SRAM
  - 比SRAM更贵，因为加了电池

# PK环节
- 易失性: RAM易失，其余非易失
- 可写：RAM、EPROM、EEPROM、Flash、NVRAM可写，PROM可写一次，Masked ROM不可写
- 最小擦除单元：Masked ROM、PROM不可擦除，EPROM整片擦除，Flash按sector擦除，其余均可以擦除一个字节
- 可编程次数：RAM、NVRAM无限次，EPROM、EEPROM、Flash有限次寿命
- 成本：SRAM、EEPROM、NVRAM成本高，DRAM、PROM、EPROM、Flash适中，Masked ROM成本低
- 速度：EEPROM、Flash读取快，擦除慢；DRAM速度适中；其余均快