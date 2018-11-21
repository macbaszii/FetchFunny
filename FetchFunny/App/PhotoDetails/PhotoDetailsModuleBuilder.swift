//
//  PhotoDetailsModuleBuilder.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

protocol PhotoDetailsModuleBuildable {
    func build(with photo: InstagramPhoto,
    imageViewURLLoadable: ImageViewURLLoadable) -> UIViewController
}

final class PhotoDetailsModuleBuilder: PhotoDetailsModuleBuildable {
    func build(with photo: InstagramPhoto,
               imageViewURLLoadable: ImageViewURLLoadable) -> UIViewController {
        guard let viewController = try? PhotoDetailsViewController.loadFromNib() else {
            fatalError("Couldn't load PhotoDetailsViewController from nib file")
        }

        let presenter = PhotoDetailsViewPresenter(
            with: photo
        )

        viewController.output = presenter
        viewController.imageViewURLLoadable = imageViewURLLoadable

        presenter.view = viewController

        return viewController
    }
}
