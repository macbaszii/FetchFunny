//
//  PhotosViewModule.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol PhotosViewInput {
    func showPhotos(with photos: [Photo])
    func showLoadingView()
    func hideLoadingView()
}

protocol PhotosViewOutput {
    func viewIsReady()
    func tapPhoto(at indexPath: IndexPath)
    func refreshPhotos()
}

protocol PhotosViewInteractorOutput {
    func loadPhotos(with string: String)
}

protocol PhotosViewInteractorInput {
    func didReceivePhotos(photos: [Photo])
}

protocol PhotosViewRouterInput {
    func navigateToPhotoDetails(with id: Int64)
}
