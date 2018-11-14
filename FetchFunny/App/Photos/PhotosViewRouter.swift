//
//  PhotosViewRouter.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class PhotosViewRouter: PhotosViewRouterInput {
    var viewController: UIViewController?

    func presentInstagramAuthorizationWebView(with url: URL) {
        let autorizationVC = InstagramAuthorizationScreenBuilder().build(with: url)
        viewController?.present(
            autorizationVC,
            animated: true,
            completion: nil)
    }

    func navigateToPhotoDetails(with id: Int64) {
        // navigate to details
    }
}
