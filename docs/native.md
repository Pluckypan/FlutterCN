# 交互

`Flutter` 虽然号称跨平台,但是仍然无法摆脱`平台`而存在，首先，仍然存在 `Android` & `iOS` 代码；其次，`Flutter`无法实现的功能,仍然需要 Android 和 iOS 去实现。

## MethodChannel

`MethodChanel` 是最简单的调用方式,用于 `Flutter` 调用 `Native` 的方法,并返回一个结果

**Flutter端**

```
class NativeManager {
  NativeManager._();

  static const platform =
      const MethodChannel('echo.engineer.fluttercn/method_channel');

  static showToast(String message) async {
    var result = await platform.invokeMethod("showToast", {"message": message});
    Helper.showToast("$result");
  }

  static Future<DeviceInfo> getDeviceInfo() async {
    var result = await platform.invokeMethod("getDeviceInfo");
    return DeviceInfo.fromJson(json.decode(result));
  }
}
```

**Native端**

```
const val METHOD_CHANNEL = "echo.engineer.fluttercn/method_channel"

MethodChannel(flutterView, METHOD_CHANNEL).setMethodCallHandler { call, result ->
    onMethodCall(call, result)
}

private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    println("method=${call.method} args=${call.arguments}")
    when (call.method) {
        "showToast" -> showToast(call, result)
        "getDeviceInfo" -> getDeviceInfo(call, result)
        else -> result.notImplemented()
    }
}

private fun showToast(call: MethodCall, result: MethodChannel.Result) {
    val message = call.argument<String>("message")
    if (!TextUtils.isEmpty(message)) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show()
        result.success(1)
    } else {
        result.error("-1", "message is empty.", null)
    }
}

private fun getDeviceInfo(call: MethodCall, result: MethodChannel.Result) {
    val json = JSONObject()
    json.put("manufacturer", Build.MANUFACTURER)
    json.put("brand", Build.BRAND)
    json.put("device", Build.DEVICE)
    json.put("model", Build.MODEL)
    json.put("sdk_int", Build.VERSION.SDK_INT)
    json.put("product", Build.PRODUCT)
    result.success(json.toString())
}
```

## EventChannel

`EventChannel` 的设计是针对一个持续事件的，比如 `Flutter` 订阅 `Native` 的电池电量,下载进度之类的事件，相对来说复杂一点

**Native端**
```
const val EVENT_CHANNEL = "echo.engineer.fluttercn/event_channel"

val eventChannel = EventChannel(flutterView, EVENT_CHANNEL)
eventChannel.setStreamHandler(object :
    EventChannel.StreamHandler {
    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        println("onListen:$arguments main=${Looper.getMainLooper() == Looper.myLooper()}")
        if (arguments != null && arguments is Map<*, *>) {
            val max = arguments["max"]
            if (max is Int) {
                callEvent(max, events)
            } else {
                events?.error("-1", "max is not define.", "")
            }
        } else {
            events?.error("-2", "arguments is null.", "")
        }
    }

    override fun onCancel(arguments: Any?) {
        println("onCancel:$arguments main=${Looper.getMainLooper() == Looper.myLooper()}")
    }

})

private fun callEvent(max: Int, events: EventChannel.EventSink?) {
    animator?.cancel()
    animator = null
    animator = ValueAnimator.ofInt(0, max).apply {
        duration = 5000
        interpolator = LinearInterpolator()
        addUpdateListener {
            events?.success(it.animatedValue as Int)
        }
    }
    animator?.start()
}
```

**Flutter端**
```
static const eventChannel =
  const EventChannel("echo.engineer.fluttercn/event_channel");

class NativePage extends State<Native> {
  var _count;
  StreamSubscription _counterSub;

  void _startCounterPlugin() {
    if (_counterSub == null) {
      _counterSub = NativeManager.eventChannel.receiveBroadcastStream({
        "message": "Hi,I'am Flutter.",
        "max": 100
      }).listen(_onCounterEvent, onError: _onCounterError);
    }
  }

  void _endCounterPlugin() {
    if (_counterSub != null) {
      _counterSub.cancel();
    }
  }

  void _onCounterError(Object error) {
    setState(() {
      _count = error;
      print(error);
    });
  }

  void _onCounterEvent(Object event) {
    setState(() {
      _count = event;
    });
  }

  @override
  void initState() {
    super.initState();
    _startCounterPlugin();
  }

  @override
  void dispose() {
    super.dispose();
    _endCounterPlugin();
  }
}          
```

## Native端调用Flutter

**Native端**

```
const val METHOD_CHANNEL = "echo.engineer.fluttercn/method_channel"
val methodChannel = MethodChannel(flutterView, METHOD_CHANNEL)
callFlutter(methodChannel)

private fun callFlutter(channel: MethodChannel) {
    channel.invokeMethod("getRandomColor", "hello", object : MethodChannel.Result {
        override fun notImplemented() {
            println("callFlutter notImplemented main=${Looper.getMainLooper() == Looper.myLooper()}")
        }

        override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
            println("callFlutter error errorCode=$errorCode  main=${Looper.getMainLooper() == Looper.myLooper()}")
        }

        override fun success(result: Any?) {
            println("callFlutter success result=$result main=${Looper.getMainLooper() == Looper.myLooper()}")
        }
    })
}
```

**Flutter端**
```
static const platform =
      const MethodChannel('echo.engineer.fluttercn/method_channel');

static setup() {
  print("NativeManager setup");
  platform.setMethodCallHandler(platformCallHandler);
}

static Future<dynamic> platformCallHandler(MethodCall call) async {
  switch (call.method) {
    case "getRandomColor":
      return colorHelper.Helper.getRandomColor().toString();
  }
}
```


## 小结
- 目前需要插件,即是基于 `MethodChannel` 或者 `EventChannel` 来实现的
- 暂时没有找到 `Native` 持续订阅 `Flutter` 的方法

## 参考链接
- [Platform Channels](https://flutterchina.club/platform-channels/)
- [插件编写](https://flutter.cn/docs/development/platform-integration/platform-channels)
