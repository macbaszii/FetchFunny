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
    }

    func authorizationIfNeeded() {
        let authorizationURL = instagramManager.autorizationEndpointURL()
        output?.didReceiveAuthorizationURL(authorizationURL)
    }

    func loadPhotos(with string: String) {
        // fetch photos
    }
}
