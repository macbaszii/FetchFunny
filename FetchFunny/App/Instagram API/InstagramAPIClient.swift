//
//  InstagramAPIClient.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 17/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol InstagramAPIClient {
    func loadMyRecentPhotos(with url: URL, completion: @escaping (Result<[InstagramPhoto]>) -> Void)
}

final class InstagramAPIClientImplementation: InstagramAPIClient {
    let networkClient: NetworkClient

    init(networkClient: NetworkClient = NetworkClientImplementation()) {
        self.networkClient = networkClient
    }

    func loadMyRecentPhotos(with url: URL, completion: @escaping (Result<[InstagramPhoto]>) -> Void) {
        let task = networkClient.request(url: url) { result in
            switch result {
            case .success(let data):
                completion(.success(self.parseInstagramPhotos(with: data)))
                return
            case .failure(let error):
                completion(.failure(error))
            }
        }

        task.resume()
    }

    private func parseInstagramPhotos(with data: Data) -> [InstagramPhoto] {
        do {
            return try JSONDecoder().decode(
                InstagramPhotosResponseWrapper.self,
                from: data
            ).instagramPhotos
        } catch {
            print("Couldn't parse list of InstagramPhoto because \(error.localizedDescription)")
            return []
        }
    }
}
