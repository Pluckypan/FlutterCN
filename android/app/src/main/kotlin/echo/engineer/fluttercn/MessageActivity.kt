package echo.engineer.fluttercn

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.fragment.app.FragmentActivity

class MessageActivity : FragmentActivity() {

    companion object {
        const val KEY = "message"
        const val REQ = 10010
        fun goto(activity: Activity, message: String) {
            Intent(activity, MessageActivity::class.java).apply {
                putExtra(KEY, message)
            }.also {
                activity.startActivityForResult(it, REQ)
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_message)
        findViewById<TextView>(R.id.tv_message).apply {
            text = intent.getStringExtra(KEY)
        }
        findViewById<Button>(R.id.btn_send).setOnClickListener {
            setResult(Activity.RESULT_OK, Intent().apply {
                putExtra(KEY, "response from Android.")
            })
            finish()
        }
    }
}