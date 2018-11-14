//
//  ApplicationDelegateHelper.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

protocol ApplicationDelegateHelper {
    func instagramTokenAlreadyExist() -> Bool
    func rootToLoginScreen()
    func rootToPhotosScreen()
}

final class ApplicationDelegateHelperImplementation: ApplicationDelegateHelper {
    let keychainManager: KeychainManager
    let mainWindow: UIWindow?
    let rootRouter: RootRouter

    init(mainWindow: UIWindow?,
         rootRouter: RootRouter,
         keychainManager: KeychainManager = KeychainManagerImplementation()) {

        self.keychainManager = keychainManager
        self.mainWindow = mainWindow
        self.rootRouter = rootRouter
    }

    func instagramTokenAlreadyExist() -> Bool {
        do {
            let _ = try keychainManager.getItem(for: InstagramManagerImplementation.Constants.obtainTokenKey)
            return true
        } catch KeychainManagerImplementation.KeychainManagerError.itemNotFound {
            return false
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }

    func rootToLoginScreen() {
        rootRouter.routeToLoginScreen()
    }

    func rootToPhotosScreen() {
        rootRouter.routeToPhotosScreen()
    }
}
