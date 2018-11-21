//
//  PhotosViewPresenter.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

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

    func logoutButtonTapped() {
        interactor?.logout()
    }
}

// MARK: - PhotosViewDataSource
extension PhotosViewPresenter: PhotosViewDataSource {
    func numberOfPhotos() -> Int {
        return photos.count
    }

    func photo(at indexPath: IndexPath) -> InstagramPhoto {
        return photos[indexPath.item]
    }
}

// MARK: - PhotosViewInteractorOutput
extension PhotosViewPresenter: PhotosViewInteractorOutput {
    func didReceivePhotos(_ photos: [InstagramPhoto]) {
        self.photos = photos

        view?.hideLoadingView()
        view?.needsReloadPhotos()
        view?.setTitle(photos[0].user.username)
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

    func didClearAccessToken() {
        guard let application = UIApplication.shared.delegate as? AppDelegate else { return }
        application.applicationDelegateHelper?.rootToLoginScreen()
    }
}

// MARK: - PhotosViewModuleInput
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
