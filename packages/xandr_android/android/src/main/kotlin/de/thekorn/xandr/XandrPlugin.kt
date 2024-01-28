package de.thekorn.xandr

import XandrHostApi
import com.appnexus.opensdk.XandrAd
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import kotlinx.coroutines.ExperimentalCoroutinesApi

class XandrPlugin : FlutterPlugin, ActivityAware, XandrHostApi {
    private lateinit var flutterPluginBinding: FlutterPlugin.FlutterPluginBinding

    private lateinit var flutterState: FlutterState

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutterState = FlutterState(binding.applicationContext, binding.binaryMessenger)
        this.flutterState.startListening(this)
        this.flutterPluginBinding = binding
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        this.flutterState.stopListening()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "de.thekorn.xandr/ad_banner",
            BannerViewFactory(
                binding.activity,
                this.flutterState
            )
        )
    }

    override fun onDetachedFromActivityForConfigChanges() {
        Log.d(
            "Xandr",
            "--> onDetachedFromActivityForConfigChanges"
        )
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        Log.d(
            "Xandr",
            "--> onReattachedToActivityForConfigChanges"
        )
        onDetachedFromActivity()
    }

    override fun onDetachedFromActivity() {
        Log.d(
            "Xandr",
            "--> onDetachedFromActivity"
        )
        onDetachedFromActivity()
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    override fun init(memberId: Long, callback: (Result<Boolean>) -> Unit) {
        this.flutterState.memberId = memberId.toInt()
        XandrAd.init(
            memberId.toInt(),
            this.flutterState.applicationContext,
            true,
            true,
            AdInitListener(this.flutterState)
        )
        this.flutterState.isInitialized.invokeOnCompletion {
            callback(Result.success(this.flutterState.isInitialized.getCompleted()))
        }
    }
}
