//
//  InstagramAuthorizationViewController.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit
import WebKit

final class InstagramAuthorizationViewController: UIViewController, NibLoadable {
    typealias NibRootType = InstagramAuthorizationViewController

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var dismissButton: UIBarButtonItem!

    var url: URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Handle this optional, please
        let urlRequest = URLRequest(url: url!)
        webView.load(urlRequest)
    }

    @IBAction func dismiss(_ item: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - WKNavigationDelegate
extension InstagramAuthorizationViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

    }
}

