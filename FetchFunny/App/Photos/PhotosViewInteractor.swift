//
//  PhotosViewInteractor.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

final class PhotosViewInteractor: PhotosViewInteractorInput {

    weak var output: PhotosViewInteractorOutput?
    private let instagramManager: InstagramManager

    init(instagramManager: InstagramManager) {
        self.instagramManager = instagramManager
        self.instagramManager.setDelegate(self)
    }

    func loadMyPhotos() {
        instagramManager.loadMyRecentPhotos(
            photosModuleInput: output as? PhotosViewModuleInput
        )
    }

    func loadPhotos(with string: String) {
        // fetch photos from string
    }

    func logout() {
        instagramManager.clearAccessToken()
        instagramManager.clearInstagramCookie()
    }
}

extension PhotosViewInteractor: InstagramManagerDelegate {
    func didReceiveMyRecentPhotos(_ photos: [InstagramPhoto]) {
        output?.didReceivePhotos(photos)
    }

    func didReceiveFailureRequest(errorMessage: String) {
        output?.didReceiveErrorRequest(errorMessage: errorMessage)
    }

    func didClearAccessToken() {
        output?.didClearAccessToken()
    }
}
