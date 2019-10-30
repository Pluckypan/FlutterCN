# 生命周期

在 `Flutter` 的世界里,`Everything is Widget.`,哪怕是 `Application`,页面,手势,etc... `Flutter` 中所指的生命周期,一般指的是 `App` 的生命周期以及 `State` 的生命周期.`StatelessWidget` 并没有所谓的生命周期.

## App生命周期
```
class _App extends State<FlutterCNApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print("LifyCycle initState");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print("LifyCycle dispose");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    /// resumed  可见可操作
    /// inactive 可见但不可操作：来电、系统弹窗、画中画
    /// paused 不可见、不可操作.Android一段时间过后就会处于 suspending 状态
    /// suspending APP暂时处于挂起状态,iOS目前不可用
    print("LifyCycle didChangeAppLifecycleState state=$state");
  }  
}
```

## State生命周期
```
class _ProfilePage extends State<ProfilePage> {
  @override
  void initState() {
    print("LifyCycle profile initState");
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
    print("LifyCycle profile dispose");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("LifyCycle profile deactivate");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("LifyCycle profile didChangeDependencies");
  }

  @override
  void didUpdateWidget(ProfilePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("LifyCycle profile didUpdateWidget changed=${oldWidget != widget}");
  }  
  @override
  Widget build(BuildContext context) {
    print("LifyCycle profile build");
  }  
}
```

## State 说明
1. 打开页面 先 `initState` 再 `didChangeDependencies`
2. 去其他页面 先 `deactivate` 再 `didChangeDependencies`
3. 从其他页面回来 先 `deactivate` 再 `didChangeDependencies`
4. 关闭页面 先 `deactivate` 再 `dispose`
5. setState() 均会触发 `build`
6. `Hot Reload` 时 Widget重建, `didUpdateWidget`
7. 一般初始化放在 `initState` 释放放在 `dispose`

## 参考文档
- [Flutter的生命週期](https://www.cnblogs.com/ssjf/p/11759366.html)
