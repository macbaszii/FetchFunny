//
//  NetwrokClient.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 16/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol NetworkClient {
    func request(url: URL, completion: @escaping ((Result<Data>) -> Void)) -> URLSessionDataTask
}

final class NetworkClientImplementation: NetworkClient {
    func request(url: URL, completion: @escaping ((Result<Data>) -> Void)) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(
            with: url)
        { (data, urlResponse, error) in

            guard error == nil else {
                guard let unwrappedError = error else { return }
                completion(.failure(unwrappedError))
                return
            }

            guard let unwrappedData = data else { return }
            completion(.success(unwrappedData))
        }

        return dataTask
    }
}
