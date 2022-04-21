//
//  ViewController.swift
//  Elden Ring Guides
//
//  Created by Ben Lambeth on 4/21/22.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        self.webView.translatesAutoresizingMaskIntoConstraints = false

        if #available(iOS 11, *) {
            self.webView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
            self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            self.webView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            self.webView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        } else {
            self.webView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        }
        
        let myURL = URL(string: "https://roundtablehold.net")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
      if navigationAction.navigationType == .linkActivated  {
        if let url = navigationAction.request.url,
           "roundtablehold.net" != url.host, UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
          decisionHandler(.cancel)
        } else {
          decisionHandler(.allow)
        }
      } else {
        decisionHandler(.allow)
      }
    }
}
