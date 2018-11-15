//
//  InstagramAuthorizationScreenBuilder.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class WebViewControllerBuilder {
    func build(with url: URL,
               delegate: WebViewControllerDelegate?) -> UIViewController {
        guard let viewController = try? WebViewController.loadFromNib()
            else {
                fatalError("Couldn't load InstagramAuthorizationViewController from nib file")
        }

        viewController.delegate = delegate
        viewController.url = url

        return viewController
    }
}
