//
//  URLValidatior.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 21/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol URLValidator {
    func isURLHasAccessToken(url: URL) -> Bool
}

final class URLValidatorImplementation: URLValidator {
    func isURLHasAccessToken(url: URL) -> Bool {
        return url.absoluteString.contains(
            InstagramManagerImplementation.Constants.accessTokenPrefix
        )
    }
}
