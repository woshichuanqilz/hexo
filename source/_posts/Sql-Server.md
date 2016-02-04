title: Sql-Server
date: 2016-01-06 19:00:24
tags: 
---
# Sql Server

## Sql Server Tools

> * Viemu
<!--more-->
> * HuntingDog for searching in the database
> * sqldecryptor 酷炫的解密工具
 
## Test Trick 
### Env Config
#### Build Env
Use While statement 
#### Restore Env
When you want to test the Efficiency of two `delete statement` , it'll be a little tricky when you exec the first del statement so you want to go back to the *Env* when the table haven't been changed yet, so you need a time machine like Tran.
> Use Tran , Tran is a time machine.

### Let's Counting
#### How to count the exec time of a specific stored procedure during a time?  
At first use the sql server profiler to track all the statement and then save the track file as a `xml file` and you will get all the related text. Use Vim to get the rows you want by using statement like `v/sp_name_Iwant/d`
![02~02_10-37-20.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~02_10-37-20.png)

## Get the property of the table or column
###System table
1. INFORMATION_SCHEMA
```sql
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE OBJECTPROPERTY(OBJECT_ID(CONSTRAINT_SCHEMA + '.' + CONSTRAINT_NAME), 'IsPrimaryKey') = 1
AND TABLE_NAME = 't1' --AND TABLE_SCHEMA = 'Schema'
```

### DMV

## Query Optimization
###Compare delete
Use merge statement 
```sql
Merge t1 
Using t2 on t1.id = t2.id
WHen Matched then
DELETE;
```

## Others
[hotkey](https://msdn.microsoft.com/zh-cn/library/ms174205.aspx?f=255&MSPPError=-2147217396)
