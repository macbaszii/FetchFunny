//
//  InstagramAuthorizationViewController.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit
import WebKit

protocol WebViewControllerDelegate: class {
    func didReceiveResultURL(_ url: URL)
}

final class WebViewController: UIViewController, NibLoadable {
    typealias NibRootType = WebViewController

    weak var delegate: WebViewControllerDelegate?

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var dismissButton: UIBarButtonItem!

    var url: URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: Handle this optional, please
        let urlRequest = URLRequest(url: url!)
        webView.navigationDelegate = self
        webView.load(urlRequest)
    }

    @IBAction func dismiss(_ item: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        guard let url = webView.url else { return }
        delegate?.didReceiveResultURL(url)
    }

}
