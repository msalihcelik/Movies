//
//  WebViewController.swift
//  Movies
//
//  Created by Celik, Salih on 9.12.2022.
//

import WebKit

final class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: Constants.movieDbUrl)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        webView.navigationDelegate = self
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.scrollView.bounces = true
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(WebViewController.refreshWebView), for: UIControl.Event.valueChanged)
        webView.scrollView.addSubview(refreshControl)
        view = webView
    }
    
    @objc
    func refreshWebView(sender: UIRefreshControl) {
        webView.reload()
        sender.endRefreshing()
    }
}

// MARK: - WebKitNavigationDelegate Methods
extension WebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let urlStr = navigationAction.request.url?.absoluteString {
            print(urlStr)
        }
        decisionHandler(.allow)
    }
}
