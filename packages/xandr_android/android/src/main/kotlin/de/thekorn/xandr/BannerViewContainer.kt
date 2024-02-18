package de.thekorn.xandr

import android.app.Activity
import android.view.View
import de.thekorn.xandr.models.ads.BannerAd
import de.thekorn.xandr.models.BannerViewOptions
import de.thekorn.xandr.models.FlutterState
import io.flutter.Log
import io.flutter.plugin.platform.PlatformView
import kotlinx.coroutines.ExperimentalCoroutinesApi

class BannerViewContainer(
    private var activity: Activity,
    private var state: FlutterState,
    private var widgetId: Int,
    private val bannerViewOptions: BannerViewOptions?
) :
    PlatformView {
    private val banner: BannerAd

    init {
        Log.d(
            "Xandr.BannerView",
            "Initializing $activity id=$widgetId " +
                "xandr-initialized=${state.isInitialized} bannerViewOptions=$bannerViewOptions"
        )

        this.banner = BannerAd(activity, state, widgetId)

        if (bannerViewOptions != null) {
            this.banner.configure(bannerViewOptions)
        }
    }

    @OptIn(ExperimentalCoroutinesApi::class)
    override fun getView(): View {
        Log.d(
            "Xandr.BannerView",
            "Return view, xandr-initialized=${state.isInitialized.isCompleted}"
        )

        state.isInitialized.invokeOnCompletion {
            Log.d(
                "Xandr.BannerView",
                "load add, xandr-initialized=${state.isInitialized.getCompleted()}"
            )
            bannerViewOptions?.loadWhenCreated?.let { loadWhenCreated ->
                if (loadWhenCreated) {
                    loadAd()
                }
            }
        }
        return this.banner
    }

    fun loadAd() {
        this.banner.loadAd()
    }

    override fun dispose() {
        this.banner.destroy()
    }
}
