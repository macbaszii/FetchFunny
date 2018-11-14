//
//  RootRouter.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

protocol RootRouter {
    func routeToLoginScreen()
    func routeToPhotosScreen()
}

final class RootRouterImplementation: RootRouter {
    let mainWindow: UIWindow?
    let routeDispatcher: RouteDispatcher

    init(mainWindow: UIWindow?,
         routeDispatcher: RouteDispatcher = RouteDispatcherImplementation()) {
        self.mainWindow = mainWindow
        self.routeDispatcher = routeDispatcher
    }

    func routeToLoginScreen() {
        mainWindow?.rootViewController = routeDispatcher.loginFlow()
    }

    func routeToPhotosScreen() {
        mainWindow?.rootViewController = routeDispatcher.photosFlow()
    }
}
