## Pomodoro Timer
A simple pomodoro timer in swift

Pomodoro Technique is a easy way to manage your time.This is a simple pomodoro timer class for your app.Click here to learn more about Pomodoro Technique:[wikipedia](https://en.wikipedia.org/wiki/Pomodoro_Technique)
### Usage:
```Swift
var pomodoroClass = pomodoro()
```

Just use this in "AppDelegate" to initialise the timer.

####Time settings

It will save default time to NSUserDefaults automaticly at first time.

Declaration

```Swift
var pomoTime = 1500 { didSet }
```
Work time

```Swift
var breakTime = 1500 { didSet }
```
Break time

```Swift
var longBreakTime = 1500 { didSet }
```
Long break time

Set personal timer,just give it a new value.It will save your change  automaticly to NSUserDefaults.

####Continuous timing

If you want to start timer after stop and use long break.

```Swift
pomodoroClass.longBreakEnable = true
```

Long break will auto start after several short break.Like this:Working->Break->Working->Break->Working->Break->Working->Break->Long break->Working->Break->......

Declaration

```Swift
var longBreakCount = 4 { didSet }
```

You can change it.

####Control

Start

```Swift
pomodoroClass.start()
```

Stop

```Swift
pomodoroClass.stop()
```
####Gets the status


It provide these data:

Declaration

```Swift
var pomoMode = 0
```

The meaning of the values

0:Done
1:Work mode
2.Break mode
3.Long break mode

```Swift
var nowTime = 0
```
Time remaining(In seconds)

```Swift
var process:Float = 0
```
Time remaining(In percentage 1-100)

```Swift
var timerLabel = "00:00"
```
Time remaining(In string)

####!!!Timer will stop when your app turn into background!!!

You can keep your app running by some way like play silent audio in background.
Click here to learn more：[Apple Developer Library](https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BackgroundExecution/BackgroundExecution.html#//apple_ref/doc/uid/TP40007072-CH4-SW23)

####Download the demo to learn more

![Imgur](http://i.imgur.com/pnzF4hb.png)

## Pomodoro Timer 中文说明
一个 Swift 制作的简易番茄计时器

番茄工作法是一种简单的管理时间的方式。你可以在你的 App 中使用这个类来直接实现番茄计时器功能。点击以下链接深入了解番茄工作法:[wikipedia](https://zh.wikipedia.org/wiki/番茄工作法)
### 用法:
```Swift
var pomodoroClass = pomodoro()
```

在"AppDelegate"中添加本行代码来初始化。
####时间设定

在第一次启动时，它会自动存储默认值到 NSUserDefaults 中

声明

```Swift
var pomoTime = 1500 { didSet }
```
工作时间

```Swift
var breakTime = 1500 { didSet }
```
休息时间

```Swift
var longBreakTime = 1500 { didSet }
```
长时休息

如果你想要使用个性化的时间,重新赋值即可。修改会被自动保存到 NSUserDefaults.

####连续计时

如果你想在计时完成后自动开始下一次计时并在几次短休息后进行长休息，可以使用以下方法。

```Swift
pomodoroClass.longBreakEnable = true
```

效果像这样:工作->休息->工作->休息->工作->休息->工作->休息->长时休息->工作->休息->......

声明

```Swift
var longBreakCount = 4 { didSet }
```

可以改的.

####控制

开始

```Swift
pomodoroClass.start()
```

停止

```Swift
pomodoroClass.stop()
```
####获取状态


提供了以下数据:

定义

```Swift
var pomoMode = 0
```

值的含义

0:待命
1:工作时间
2.休息时间
3.长时休息

```Swift
var nowTime = 0
```
剩余时间（以秒计）

```Swift
var process:Float = 0
```
剩余时间（以百分比计 1-100)

```Swift
var timerLabel = "00:00"
```
剩余时间（字符串表示）

####!!!一旦 App 进入后台，计时将会停止!!!

有一些办法可以保持你 App 的运行，比如播放无声的音频。
点击这里了解更多：[Apple Developer Library](https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BackgroundExecution/BackgroundExecution.html#//apple_ref/doc/uid/TP40007072-CH4-SW23)

####下载测试工程了解更多

![Imgur](http://i.imgur.com/pnzF4hb.png)
