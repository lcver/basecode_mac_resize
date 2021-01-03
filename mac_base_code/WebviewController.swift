//
//  WebviewController.swift
//  mac_base_code
//
//  Created by Yapindo on 03/01/21.
//

import Cocoa
import WebKit

class WebviewController: NSViewController, NSWindowDelegate {
    
    private var WebView: WKWebView!
    public var AppTemp: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        
        // Delegating window self
        self.view.window?.delegate = self
        
        
        if let screenWindow = self.view.window?.frame {
            let rect = screenWindow.size
            let frameRect = NSRect(x: 0, y: 0, width: rect.width, height: rect.height)
            frameViewWK(frameRect: frameRect)
            setViewURL(file: AppTemp)
        }
    }
    
    func windowWillResize(_ sender: NSWindow, to frameSize: NSSize) -> NSSize {
        WebView.frame.size = frameSize
        return frameSize
    }
    
}

extension WebviewController: WKUIDelegate, WKNavigationDelegate {
    // Create Configuration
    private func configurationWK() -> WKWebViewConfiguration {
        let pref = WKPreferences()
        pref.javaScriptEnabled = true
        pref.javaScriptCanOpenWindowsAutomatically = true
        pref.setValue(true, forKey: "AllowFileAccessFromFileURLs")

        let config = WKWebViewConfiguration()
        config.preferences = pref


        return config
    }

    // Create Frame View
    private func frameViewWK(frameRect: NSRect) {

        WebView = WKWebView(frame: frameRect, configuration: configurationWK())
        WebView.navigationDelegate = self

    }

    // Set to load view
    private func setViewURL(file: String) {
        let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: file)!
        WebView.loadFileURL(url, allowingReadAccessTo: url)
        let req = URLRequest(url: url)
        WebView.load(req)

        self.view.addSubview(WebView)
    }
}
