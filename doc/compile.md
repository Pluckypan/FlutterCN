## 编译模式
编程语言要达到可运行的目的需要经过编译，一般地来说，编译模式分为两类：JIT 和 AOT。这篇文章很好的说明了 [Flutter的编译模式](https://www.itcodemonkey.com/article/7077.html)。

|平台|Android|iOS|
|:--:|:--:|:--:|
|Script|不支持|不支持|
|Script Snapshot|理论支持|理论支持|
|Kernel Snapshot|支持，runmode = dynamic|支持，runmode = dynamic|
|CoreJIT|不支持|支持|
|AOT|Assembly|支持|支持|

下面是我的理解.Flutter在 release 和 debug 模式下采用的编译模式是不一样的,对应生成的产物也是不一样的.

## Debug
debug 对应的编译模式是 `JIT`,及`Just In Time`(即时编译）.`Flutter` 所称道的 `Hot Reload` ,`Hot Restart` 正是得益于 `JIT`才得以实现. `debug` 模式下：
- 产物较大: **56.2MB**
- 不会打包构建界面的代码
- 界面不流畅
- 编译模式: Kernel Snapshot
- **待研究** Hot Reload 原理：[揭秘Flutter Hot Reload](https://www.jianshu.com/p/69c96cefc810)

![debug](/assets/img/debug.png)
## Release
- 产物较大: **7.2MB**
- 所有界面均打包为 `libapp.so`
- 界面流畅
- 编译模式: Core JIT(Android) & AOT Assembly(iOS)
![release](/assets/img/release.png)
