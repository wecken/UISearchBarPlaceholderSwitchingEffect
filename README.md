# What is this?

This is a demo iOS app that plays an animation in searchbar placeholder text.
In the search bar, placeholder is randomly selected from predefined array. Then, it shows another placeholders with fade-in/out effect one by one.
It is usefule because it can show example search keywords in specific manner, and can show variety of them. 

<img src="'https://storage.googleapis.com/zenn-user-upload/p0cmkr5i4ds78ywdl22ey0w08fqg">

# How to use

Take whatever the lines of codes you need.
All you need is written in ViewController.swift

# What's great about it?
UIKit offers simple ways to implement annimation, like `view.animate()`.
However, some of the parameters cannot be animated with that API, like `UILabel`'s opacity, for example.
In this project, placeholder's opacity changes over time with non-UIKit API called CADisplayLink.
CADisplayLink is a CoreAnimation API that allows to synchronize code executions to a display refresh rate, which is normally 60fps.
NSTimer is sometimes used for similar purpose, but it seems not gurantee the execution timing, and the rate is not as high as 60fps.
For animation, CADisplayLink is more appropreate, though it is a bit tricky. 

# Note
Execution of the animation is done in main thread. If another animation is ongoing in main thread, this animation might stop.
