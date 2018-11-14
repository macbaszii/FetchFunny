//
//  PhotosViewModuleBuilder.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

protocol PhotosViewModuleBuildable {
    func build() -> UIViewController
}

final class PhotosViewModuleBuilder: PhotosViewModuleBuildable {
    func build() -> UIViewController {
        guard let viewController = try? PhotosViewController.loadFromNib() else {
            fatalError("Could not load PhotosViewController from nib file")
        }

        let instagramManager = InstagramManagerImplementation()

        let presenter = PhotosViewPresenter()
        let interactor = PhotosViewInteractor(
            instagramManager: instagramManager
        )
        let router = PhotosViewRouter()

        viewController.output = presenter

        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router

        interactor.output = presenter

        router.viewController = viewController

        return viewController
    }
}
