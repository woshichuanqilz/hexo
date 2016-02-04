title: Linux-crontab-to-make-timer
date: 2016-01-06 19:00:24
tags: 
---
[Linux manual about crontab](http://linuxtools-rst.readthedocs.org/zh_CN/latest/tool/crontab.html)

At first you should read the subhead of the article.

## first step crontab -e
<!--more-->


## second step follow the instruction to add a task
like 
`0,15,30,45 18-06 * * * /bin/echo 'date' > ~/test.txt`

## at last save & exit the file 
the timer will begin

## Notice I use the echo failure? Why?
[Echo in crontab can't be output to a terminal normally](http://unix.stackexchange.com/questions/233493/cron-bash-script-echo-to-current-terminal-instead-of-var-spool-mail-root)

You can use the write command like this can help you output the text to an specific terminal.

![01~30_19-14-58.png](http://7xpvdr.com1.z0.glb.clouddn.com/01~30_19-14-58.png)
