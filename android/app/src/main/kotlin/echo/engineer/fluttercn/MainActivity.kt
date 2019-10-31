package echo.engineer.fluttercn

import android.animation.ValueAnimator
import android.app.Activity
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.os.Looper
import android.text.TextUtils
import android.view.animation.LinearInterpolator
import android.widget.Toast
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import org.json.JSONObject

class MainActivity : FlutterActivity() {

    companion object {
        const val METHOD_CHANNEL = "echo.engineer.fluttercn/method_channel"
        const val EVENT_CHANNEL = "echo.engineer.fluttercn/event_channel"
    }

    private var animator: ValueAnimator? = null
    private var methodResult: MethodChannel.Result? = null
    private var methodChannel: MethodChannel? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        // 注册方法回调
        methodChannel = MethodChannel(flutterView, METHOD_CHANNEL)
        methodChannel?.setMethodCallHandler { call, result ->
            onMethodCall(call, result)
        }

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
    }

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

    override fun onResume() {
        super.onResume()
        animator?.start()
    }

    override fun onPause() {
        super.onPause()
        animator?.cancel()
    }

    private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        methodResult = result
        println("method=${call.method} args=${call.arguments}")
        when (call.method) {
            "sayHi" -> sayHi()
            "showToast" -> showToast(call, result)
            "getDeviceInfo" -> getDeviceInfo(call, result)
            "openMessageActivity" -> openMessageActivity(call, result)
            else -> result.notImplemented()
        }
    }

    private fun sayHi() {
        println("called sayHi()")
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

    private fun openMessageActivity(call: MethodCall, result: MethodChannel.Result) {
        val message = call.argument<String>("message")
        if (!TextUtils.isEmpty(message)) {
            methodChannel?.let {
                callFlutter(it)
            }
            MessageActivity.goto(this, message!!)
        } else {
            result.error("-1", "message is empty.", null)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        when (requestCode) {
            MessageActivity.REQ -> {
                if (resultCode == Activity.RESULT_OK && data != null) {
                    methodResult?.success(data.getStringExtra(MessageActivity.KEY))
                } else {
                    methodResult?.error("-1", "no result", "")
                }
            }
        }
    }
}
