package com.example.flutter_lab

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.StringCodec
import io.flutter.plugins.GeneratedPluginRegistrant

//class MainActivity : FlutterActivity() {
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine)
//
//        // Message Channel Test
//        val channel = BasicMessageChannel<String>(flutterEngine.dartExecutor,
//            "myMessageChannel", StringCodec.INSTANCE)
//        channel.setMessageHandler { message, reply ->
//            Log.d("msg", "Receive : $message")
//            reply.reply("Reply from Android")
//            channel.send("Hello from Android") { replay ->
//                Log.d("msg", "Reply : $replay")
//            }
//        }
//    }
//}

//class MainActivity : FlutterActivity() {
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine)
//
//        // Method Channel Test
//        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "myMethodChannel")
//        methodChannel.setMethodCallHandler { call, result ->
//            io.flutter.Log.d("Flutter", call.toString())
//            if (call.method == "oneMethod") {
//                val map = call.arguments as Map<String, String>
//                io.flutter.Log.d("Flutter", "${map.get("Username")}, " + "${map.get("Password")}")
//                result.success(mapOf("one" to 10, "two" to 20))
//
//                // Send data
//                methodChannel.invokeMethod("twoMethod", "Hello from Android",
//                    object : MethodChannel.Result {
//                        override fun success(result: Any?) {
//                            io.flutter.Log.d("Flutter", "${result as String}")
//                        }
//                        override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {}
//                        override fun notImplemented() {}
//                    }
//                )
//            } else {
//                result.notImplemented()
//            }
//        }
//    }
//}

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        // Event Channel Test
        val eventChannel = EventChannel(flutterEngine.dartExecutor, "myEventChannel");
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(p0: Any?, p1: EventChannel.EventSink?) {
                io.flutter.Log.d("Platform", "onListen.......")
                p1?.success("Send event data... from native...")
            }
            override fun onCancel(p0: Any?) {}
        })
    }
}