title: 从零开始如何在Win7上配置FTP
date: 2016-01-06 19:00:24
tags: 
---
#从零开始 如何在win7上配置ftp 

##1. 打开IIS服务, 和ftp服务功能
如图所示:

<!--more-->
![01~25_12-19-45.png](http://7xpvdr.com1.z0.glb.clouddn.com/01~25_12-19-45.png)

然后在小的窗口里面打开, 勾选ftp 服务, 和web管理工具的服务。两个必须都要打开。
![01~25_12-20-44.png](http://7xpvdr.com1.z0.glb.clouddn.com/01~25_12-20-44.png)

> 如果你的服务里面没有这些选项, 那么就是你没有安装这些服务这在win7的某些版本上是存在的。
你需要下载一个补丁:
[下载下载连接](https://www.microsoft.com/en-us/download/details.aspx?id=7887)
下载后安装重复步骤一。

##2. 进入windows管理工具配置
控制面板->管理工具 (注意孔壁面板查看类型选择小图标模式才是我这种样子)。
![01~25_12-27-53.png](http://7xpvdr.com1.z0.glb.clouddn.com/01~25_12-27-53.png)

得到如下图片:
选择iis管理器
![01~25_12-35-47.png](http://7xpvdr.com1.z0.glb.clouddn.com/01~25_12-35-47.png)

网站添加ftp:
![01~25_13-19-18.png](http://7xpvdr.com1.z0.glb.clouddn.com/01~25_13-19-18.png)

关于ftp配置的具体的步骤参考这里
[4步按安装ftp](http://blog.sina.com.cn/s/blog_3f7e47f20100haur.html)

> 这里有一点需要注意的是:
  在上面的步骤完成之后你在其他机器上登录的时候有可能报错, "invalid hostname"
这个是因为你在ftp里面为ftp设置了一个别名
![01~25_13-27-30.png](http://7xpvdr.com1.z0.glb.clouddn.com/01~25_13-27-30.png)

解决的办法是不要配置这个别名, 或者在登陆的时候这么写
`ftp.yourname.com|youraccountname` 这样

好了~   

All done, enjoy your ftp! 



## Contact Us Link
Use mailto:513278236@qq.com
![02~02_11-30-53.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~02_11-30-53.png)

