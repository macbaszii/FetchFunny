//
//  InstagramAPIHelper.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol InstagramManager {
    func autorizationEndpointURL() -> URL
}

final class InstagramManagerImplementation: InstagramManager {
    struct Endpoints {
        static let authorization = "https://api.instagram.com/oauth/authorize/"
    }

    struct Constants {
        static let clientID = "cc12b60bb0e341a7a956c2a7b1585d19"
        static let redirectURI = "http://www.shutterstock.com/g/macbaszii"
        static let responseType = "token"
    }

    func autorizationEndpointURL() -> URL {
        guard let autorizationURL = URL(string: String(format: "%@?client_id=%@&redirect_uri=%@&response_type=%@", Endpoints.authorization, Constants.clientID, Constants.redirectURI, Constants.responseType)) else {
            fatalError("Still need something to create authorization URL, please check")
        }

        return autorizationURL
    }
}
