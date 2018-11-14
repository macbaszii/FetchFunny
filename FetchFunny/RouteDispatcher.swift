//
//  RouteDispatcher.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

protocol RouteDispatcher {
    func loginFlow() -> UIViewController
    func photosFlow() -> UIViewController
}

final class RouteDispatcherImplementation: RouteDispatcher {
    func loginFlow() -> UIViewController {
        return InstagramLoginScreenBuilder().build()
    }

    func photosFlow() -> UIViewController {
        let photosViewController = PhotosViewModuleBuilder().build()
        let navigationController = UINavigationController(
            rootViewController: photosViewController
        )

        return navigationController
    }
}
