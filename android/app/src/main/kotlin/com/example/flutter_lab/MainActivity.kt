package com.example.flutter_lab

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // Message Channel Test
        val channel = BasicMessageChannel<String>(flutterEngine.dartExecutor,
                        "myMessageChannel", StringCodec.INSTANCE)
        channel.setMessageHandler { message, reply ->
                Log.d("msg", "Receive : $message")
                reply.reply("Reply from Android")
                channel.send("Hello from Android") { replay ->
                    Log.d("msg", "Reply : $replay")
            }
        }
    }
}