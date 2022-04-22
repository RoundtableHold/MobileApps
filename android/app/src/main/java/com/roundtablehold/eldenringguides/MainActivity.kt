package com.roundtablehold.eldenringguides

import android.content.Intent
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.core.content.ContextCompat.startActivity

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val webView = WebView(applicationContext)
        setContentView(webView)
        webView.settings.javaScriptEnabled = true
        class MyWebViewClient : WebViewClient() {
            override fun shouldOverrideUrlLoading(view: WebView?, url: String?): Boolean {
                if (Uri.parse(url).host == "roundtablehold.net") {
                    return false;
                }

                Intent(Intent.ACTION_VIEW, Uri.parse(url)).apply {
                    startActivity(this)
                }
                return true
            }
        }
        webView.webViewClient = MyWebViewClient()
        webView.loadUrl("https://roundtablehold.net")
    }
}
