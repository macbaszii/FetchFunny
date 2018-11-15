//
//  InstagramLoginRouter.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class InstagramLoginRouter: InstagramLoginRouterInput {
    var viewController: UIViewController?

    func presentAuthorizationScreen(with url: URL,
                                    webViewDelegate: WebViewControllerDelegate) {
        let authorizationScreen = WebViewControllerBuilder().build(
            with: url,
            delegate: webViewDelegate)
        viewController?.present(
            authorizationScreen,
            animated: true,
            completion: nil
        )
    }
}
