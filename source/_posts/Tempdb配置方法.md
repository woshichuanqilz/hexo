title: '跟踪标志位1117,1118以及Tempdb的配置方法(译)'
date: 2016-01-06 18:04:23
tags: SQL Server 
---
SQL Server 设有一些配置tempdb的选项。而且令人兴奋的是, Microsoft在KB 2154845中给了我们一些如何处理会影响tempdb性能的资源竞争的问题的建议, 但是, 事情还是有一些令人疑惑, 我们下面来详细的解释一下。

<!--more-->

> * 跟踪标记1118 - 只能分配整个区
<!--more-->

    KB 2154845 建议跟踪标记1118 在一些情形中是有用的。这个跟踪标记高所SQL SERVER避免**混合区**的使用取而代之的是整个区的分配。(这个连接获取更多的关于去的知识)

    这就意味着在实例中所有数据库中被新分配空间的对象, 会得到专属这个对象的64kb的数据空间。Tempdb大多情况下是创建对象最多的地方, 所以, 启用这个跟踪标记意味着会对Tempdb产生相对最大的影响。

    因为, 这个跟踪标记在KB 2154845中被提倡建议使用, 所以, 很明显这个跟踪标记的使用是相对安全的。但是出于这样或者那样的原因, 这个跟踪标记还是没有被写道SQL SERVER联机丛书里面。

> * 跟踪标记1117 - 平均的增长文件组中的每一个文件容量
    跟踪标记 1117改变了文件的增长行为 : 如果文件组中的一个数据文件发生曾峥, SQL SERVER会迫使文件组中的其他文件也增长。这个设定在经常会配置为多个文件(就想在KB 2154845中建议的那样)的Tempdb中会起到作用。

    然而, 并不是每个人喜欢去启用这个跟踪标记, 特别是这个跟踪标记会影响实例中的所有数据库而不是仅仅针对Tempdb. 个人认为, 我更喜欢为Tempdb预先分配好空间, 让后来的数据去填满你的Tempdb, 仅仅为你的"自由空间监视"预留空间就好。无论什么事我可以避免使用跟踪标记的话, 我就不用他: 这样的话就会更不容易触发边缘情况。
