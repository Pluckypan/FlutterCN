package echo.engineer.fluttercn

import android.app.Activity
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.text.TextUtils
import android.widget.Toast
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import org.json.JSONObject

class MainActivity : FlutterActivity() {

    companion object {
        const val CHANNEL = "echo.engineer.fluttercn/channel"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        // 注册方法回调
        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            onMethodCall(call, result)
        }
    }

    private fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
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

                } else {

                }
            }
        }
    }
}
