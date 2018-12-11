//
//  InstagramLoginInteractor.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

final class InstagramLoginInteractor: InstagramLoginInteractorInput {
    let instagramManager: InstagramManager
    let keychain: KeychainManager

    weak var output: InstagramLoginInteractorOutput?

    init(instagramManager: InstagramManager,
         keychain: KeychainManager) {
        self.instagramManager = instagramManager
        self.keychain = keychain
    }

    func createAuthoirizationURLForInstagram() {
        let url = instagramManager.autorizationEndpointURL()
        output?.didReceiveAuthorizationURL(url)
    }

    func storeAccessToken(from url: URL) {
        do {
            guard let accessToken = instagramManager.extractAccessToken(from: url) else { return }
            try keychain.setItem(
                accessToken,
                for: InstagramManagerImplementation.Constants.obtainTokenKey
            )
            output?.didStoreAccessToken()
        } catch KeychainManagerImplementation.KeychainManagerError.setItemFailed(let messsage) {
            print(messsage)
        } catch {
            print(error.localizedDescription)
        }
    }
}
