//
//  InstagramLoginScreenBuilder.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class InstagramLoginScreenBuilder {
    func build() -> UIViewController {
        guard let viewController = try? InstagramLoginViewController.loadFromNib() else {
            fatalError("Couldn't load InstagramLoginViewController from nib file")
        }

        let urlValidator = URLValidatorImplementation()
        let presenter = InstagramLoginPresenter(urlValidator: urlValidator)
        let instagramManager = InstagramManagerImplementation()
        let keychainManager = KeychainManagerImplementation()
        let interactor = InstagramLoginInteractor(
            instagramManager: instagramManager,
            keychain: keychainManager
        )
        let router = InstagramLoginRouter()

        viewController.output = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = viewController

        return viewController
    }
}
