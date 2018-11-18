//
//  InstagramAPIHelper.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol InstagramManagerDelegate: class {
    func didReceiveMyRecentPhotos(_ photos: [InstagramPhoto])
    func didReceiveFailureRequest(errorMessage: String)
}

protocol InstagramManager {
    func setDelegate(_ delegate: InstagramManagerDelegate?)
    func autorizationEndpointURL() -> URL
    func extractAccessToken(from url: URL) -> String
    func loadMyRecentPhotos(photosModuleInput: PhotosViewModuleInput)
}

final class InstagramManagerImplementation: InstagramManager {
    struct Endpoints {
        static let authorization = "https://api.instagram.com/oauth/authorize/"
        static let myRecentPhotos = "https://api.instagram.com/v1/users/self/media/recent/"
    }

    struct Constants {
        static let clientID = "cc12b60bb0e341a7a956c2a7b1585d19"
        static let redirectURI = "https://www.shutterstock.com/g/macbaszii"
        static let responseType = "token"
        static let obtainTokenKey = "com.instagram.token"
        static let accessTokenPrefix = "access_token="
    }

    weak var delegate: InstagramManagerDelegate?

    let keychain: KeychainManager
    let apiClient: InstagramAPIClient

    init(keychain: KeychainManager = KeychainManagerImplementation(),
         apiClient: InstagramAPIClient = InstagramAPIClientImplementation()) {

        self.keychain = keychain
        self.apiClient = apiClient
    }

    func setDelegate(_ delegate: InstagramManagerDelegate?) {
        self.delegate = delegate
    }

    func autorizationEndpointURL() -> URL {
        guard let autorizationURL = URL(string: String(format: "%@?client_id=%@&redirect_uri=%@&response_type=%@", Endpoints.authorization, Constants.clientID, Constants.redirectURI, Constants.responseType)) else {
            fatalError("Still need something to create authorization URL, please check")
        }

        return autorizationURL
    }

    func extractAccessToken(from url: URL) -> String {
        let accessTokenPart = url.absoluteString.split(separator: "#")[1]
        let accessToken = accessTokenPart.replacingOccurrences(
            of: Constants.accessTokenPrefix,
            with: ""
        )

        return accessToken
    }

    func loadMyRecentPhotos(photosModuleInput: PhotosViewModuleInput) {
        getAccessToken { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let token):
                strongSelf.apiClient.loadMyRecentPhotos(
                    with: strongSelf.myRecentPhotosEndpoint(with: token)!,
                    completion: { result in
                        switch result {
                        case .success(let photos):
                            strongSelf.delegate?.didReceiveMyRecentPhotos(photos)
                        case .failure(let error):
                            strongSelf.delegate?.didReceiveFailureRequest(
                                errorMessage: error.localizedDescription
                            )
                        }
                    }
                )
            case .failure(let error):
                photosModuleInput.retrivedAccessTokenNotFound(
                    with: error.localizedDescription
                )
            }
        }
    }

    private func myRecentPhotosEndpoint(with accessToken: String) -> URL? {
        return URL(string: String(
            format: "%@?%@%@",
            Endpoints.myRecentPhotos,
            Constants.accessTokenPrefix,
            accessToken
        ))
    }

    private func getAccessToken(handler: @escaping (Result<String>) -> Void) {
        do {
            return handler(.success(try keychain.getItem(for: Constants.obtainTokenKey)))
        } catch KeychainManagerImplementation.KeychainManagerError.itemNotFound(let message) {
            return handler(.failure(KeychainManagerImplementation.KeychainManagerError.itemNotFound(
                message: message
            )))
        } catch {
            print(error.localizedDescription)
        }
    }
}
