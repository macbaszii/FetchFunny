//
//  PhotosViewModule.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

protocol PhotosViewModuleInput {
    func retrivedAccessTokenNotFound(with errorMessage: String)
}

protocol PhotosViewInput: class {
    func needsReloadPhotos()
    func showLoadingView()
    func hideLoadingView()
    func showAlert(_ alert: UIAlertController)
    func setTitle(_ title: String)
}

protocol PhotosViewDataSource {
    func numberOfPhotos() -> Int
    func photo(at indexPath: IndexPath) -> InstagramPhoto
}

protocol PhotosViewOutput {
    func viewIsReady()
    func fetchPhotos(with string: String)
    func tapPhoto(at indexPath: IndexPath)
}

protocol PhotosViewInteractorInput {
    func loadMyPhotos()
    func loadPhotos(with string: String)
}

protocol PhotosViewInteractorOutput: class {
    func didReceivePhotos(_ photos: [InstagramPhoto])
    func didReceiveErrorRequest(errorMessage: String)
}

protocol PhotosViewRouterInput {
    func navigateToPhotoDetails(for photo: InstagramPhoto)
}
