title: KBEngine learn note
---
# KBEngine learn note
## You do a lot of work yesterday but you haven't get a main idea, that's the question.
The easiest way to get the things done is to from the main idea, that means you should from the `Main` to get it done.
### KBENGINE_MAIN
Check the Install CrashHandler, ParseMainCommandArgs
We summarize the main points in the kbe main and we will get the frame of the KBE
#### 1. LoadConfig()
<!--more-->
lib(folder) ----> Server(folder) ----> ServerConfig.cpp ----> (Singleton)ServerCpmfig ----> loadConfig (read the xml file, which contains all the app info here)

*Here is the kbengine_defs.xml you will get the more concrete conception here*

![01~03_11-27-39.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~03_11-27-39.png)

**We want to know what contains in the server folder.**
> 1. Serverapp.cpp ServerApp.h I think this is the most important things here.
> 2. Entity
> 3. Common, and here we know that all the folder contains common file
> 4. Telnet.

Check the search result in get in the `src` folder
![02~03_11-06-08.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~03_11-06-08.png)

#### 2. g_componentID = genUUID64()
*Use Time, Random number and logapp count to comprise the unique ID*

> time();这个函数其实保存的是一个历史时间，所以需要用NULL把这个历史时间清空一下，time()就会自动保存当前时间了。你可以简单的理解为NULL就是给time()初始化。

#### 3. parseMainCommandArgs(argc, argv)

KBEMain Contains two functions one is main function, one is kbemain function,  `main` function call `kbemain`  and kbeMain concatenate the para next to the kbe 
In another words the 2nd pic is a part of the 1st pic
![02~03_10-39-12.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~03_10-39-12.png)

![02~03_10-43-59.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~03_10-43-59.png)


#### 4. Then you will get some Crash or Exception process

### And then we will discuss the kbeMain
#### 1. first get the LoginApp info
#### 2. then will get the real part kbeMainT<Loginapp>
### Template Function kbeMainT
#### 1.SetEnv 
Set the env value here. **Notice that: Env Variable is not all path**
![02~03_14-41-51.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~03_14-41-51.png)

#### 2.startLeakDetection

#### 3.DebugHelper::initialize
DebugHelper is also a Singleton

#### 4. kbekey insure the security of the information 

#### 5. Init Network::EventDispatcher

> 1. DebugHelper::getSingleton().pDispatcher(&dispatcher)
> 2. g_pDebugHelperSyncHandler->startActiveTick()
> 3. DebugHelper::getSingleton().pDispatcher->addTimer(xxxxx)

#### 6. Init ChannelCommon() get the common msg of the Channel
`init channelCommon infomation`

#### 7. Init Use the Channel info which is init before to config the DebugHelper

#### 8. Init Components

#### 9. Create , init , and run  serverapp






**Introspection**
* Learn a thing or function separately from the whole structure is meanlingless, for example if you want to check the LoadConfig, just look at the implement of the LoadConfig is not that insteresting, and I think read the ServerConfig is more important here.
![02~03_10-53-40.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~03_10-53-40.png)


## Client APP
*Haven't found the call position in the code*

##Thread
### WhileProcess Core
```cpp
void EventDispatcher::processUntilBreak()
{
	if(breakProcessing_ != EVENT_DISPATCHER_STATUS_BREAK_PROCESSING)
		breakProcessing_ = EVENT_DISPATCHER_STATUS_RUNNING;

	while(breakProcessing_ != EVENT_DISPATCHER_STATUS_BREAK_PROCESSING) // here is the xx
	{
		this->processOnce(true);
	}
}
```

### Cross Platform & Macro about the thread
![02~01_14-11-30.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~01_14-11-30.png)

Every serverapp get a threadpool.
![02~02_14-31-22.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~02_14-31-22.png)

1.  Question 1 why use mutex and Signal both
![02~01_14-22-09.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~01_14-22-09.png)


## Timer
**Class inherit**
### Timer
*Class inherit:*
> Timer ----> ServerApp ----> PythonApp ----> LogonApp ----> HandleTimeout

*Call stack*

> kbeMain ----> LoginApp::run() ----> ServerApp::run() ----> EventDispatcher::processUntilBreak() ----> EventDispatcher::prcessOnce() ----> EventDispatcher::prcessTimers ----> Timer64::prcess ----> Timer64::triggerTimer() ----> LoginApp::handleTimeout

ServerApp contains thread pool ----> OnMainThreadTick
process ----> triggerTimer ----> handleTimeout
TimeBase ----> Time
TimersBase ----> TimersT

LogonApp 
handleTimeout ----> handleMainTick ----> onMainThreadTick
*but you can't find who call handleTimeout*
Let's check this.
![02~02_17-12-17.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~02_17-12-17.png)

I haven't search for the `EventDispatcher` , which contains the other defination of the timer (`timer64`)
And the process is called here in the EventDispatcher.
![02~02_17-23-12.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~02_17-23-12.png)

### TimerS
TimersT ----> process 
TimersT ----> timeQueue_

### in serverapp level
`handleTimers call prcess`
we should know who call the handleTimers

**PythonApp** get the handletimeout to deal with the handleTimer
**PythonApp** is the derive from the serverapp 

ServerApp can be regard as the base of all the App 
![02~02_16-56-31.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~02_16-56-31.png)

And nearly all the app overwrite the handleTimer function 
![02~02_16-59-28.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~02_16-59-28.png)


Timers is a member variable of the `Serverapp`, 

and we get this : 
```cpp
void ServerApp::handleTimers()
{
	AUTO_SCOPED_PROFILE("callTimers");
	timers().process(g_kbetime);
}

//g_kbetime global variable for the time now
GAME_TIME g_kbetime = 0;
```

## Sync Mechanism
**Take the example of the DebugHelper**
### finalise ----> sync ----> read the buffer until it's empty
The core of the finalise is call sync.
The core of the sync is call the `read buffer`
```cpp
while(!bufferedLogPackets_.empty())
{
	if((g_kbeSrvConfig.tickMaxSyncLogs() > 0 && i++ >= g_kbeSrvConfig.tickMaxSyncLogs()))
	break;
	
	Network::Bundle* pBundle = bufferedLogPackets_.front();
	bufferedLogPackets_.pop();
	pBundle->finiMessage(true);
	bundles.push_back(pBundle);
	--hasBufferedLogPackets_;
}
```


## ServerApp
All the member variable in the `ServerApp`
```cpp
protected:
	COMPONENT_TYPE											componentType_;
	COMPONENT_ID											componentID_;									// 本组件的ID

	Network::EventDispatcher& 								dispatcher_;	
	Network::NetworkInterface&								networkInterface_;
	
	Timers													timers_;

	// app启动顺序， global为全局(如dbmgr，cellapp的顺序)启动顺序， 
	// group为组启动顺序(如:所有baseapp为一组)
	COMPONENT_ORDER											startGlobalOrder_;
	COMPONENT_ORDER											startGroupOrder_;

	Shutdowner*												pShutdowner_;
	ComponentActiveReportHandler*							pActiveTimerHandle_;

	// 线程池
	thread::ThreadPool										threadPool_;
```


### Others
#### TimeStamp
时间戳（timestamp），通常是一个字符序列，唯一地标识某一刻的时间。

#### Priority_queue , Heap
After make_heap a vector will popup the most value 
After sort_heap the vector will be ordered.
