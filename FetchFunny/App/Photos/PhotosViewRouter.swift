//
//  PhotosViewRouter.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class PhotosViewRouter: PhotosViewRouterInput {
    let detailsBuilder: PhotoDetailsModuleBuildable

    var viewController: UIViewController?

    init(detailsBuilder: PhotoDetailsModuleBuildable = PhotoDetailsModuleBuilder()) {
        self.detailsBuilder = detailsBuilder
    }

    func navigateToPhotoDetails(for photo: InstagramPhoto) {
        let detailsVC = detailsBuilder.build(
            with: photo,
            imageViewURLLoadable: ImageViewURLLoadableImplementation()
        )
        viewController?.navigationController?.pushViewController(
            detailsVC,
            animated: true
        )
    }
}
