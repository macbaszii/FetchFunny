//
//  PhotosViewPresenter.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

final class PhotosViewPresenter: PhotosViewOutput {
    weak var view: PhotosViewInput?
    var interactor: PhotosViewInteractorInput?
    var router: PhotosViewRouterInput?

    let alertManager: AlertManager

    var photos: [InstagramPhoto] = []

    init(with alertManager: AlertManager = AlertManagerImplementation()) {
        self.alertManager = alertManager
    }

    func viewIsReady() {
        view?.showLoadingView()
        interactor?.loadMyPhotos()
    }

    func fetchPhotos(with string: String) {
        view?.showLoadingView()
        interactor?.loadPhotos(with: string)
    }

    func tapPhoto(at indexPath: IndexPath) {
        router?.navigateToPhotoDetails(for: photo(at: indexPath))
    }
}

extension PhotosViewPresenter: PhotosViewDataSource {
    func numberOfPhotos() -> Int {
        return photos.count
    }

    func photo(at indexPath: IndexPath) -> InstagramPhoto {
        return photos[indexPath.item]
    }
}

extension PhotosViewPresenter: PhotosViewInteractorOutput {
    func didReceivePhotos(_ photos: [InstagramPhoto]) {
        self.photos = photos

        view?.hideLoadingView()
        view?.needsReloadPhotos()
    }

    func didReceiveErrorRequest(errorMessage: String) {
        let alert = alertManager.createAlertView(
            title: nil,
            message: errorMessage,
            proceedButtonTitle: "Ok",
            cancelButtonTitle: nil,
            proceedCompletion: nil,
            cancelCompletion: nil
        )
        view?.showAlert(alert)
    }
}

extension PhotosViewPresenter: PhotosViewModuleInput {
    func retrivedAccessTokenNotFound(with errorMessage: String) {
        let alert = alertManager.createAlertView(
            title: nil,
            message: errorMessage,
            proceedButtonTitle: "Ok",
            cancelButtonTitle: nil,
            proceedCompletion: nil,
            cancelCompletion: nil
        )
        view?.showAlert(alert)
    }
}
