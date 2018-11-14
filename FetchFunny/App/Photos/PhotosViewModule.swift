//
//  PhotosViewModule.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol PhotosViewInput: class {
    func showPhotos(with photos: [Photo])
    func showLoadingView()
    func hideLoadingView()
}

protocol PhotosViewOutput {
    func viewIsReady()
    func fetchPhotos(with string: String)
    func tapPhoto(at indexPath: IndexPath)
    func refreshPhotos()
}

protocol PhotosViewInteractorInput {
    func authorizationIfNeeded()
    func loadPhotos(with string: String)
}

protocol PhotosViewInteractorOutput: class {
    func didReceiveAuthorizationURL(_ url: URL)
    func didReceivePhotos(photos: [Photo])
}

protocol PhotosViewRouterInput {
    func presentInstagramAuthorizationWebView(with url: URL)
    func navigateToPhotoDetails(with id: Int64)
}
