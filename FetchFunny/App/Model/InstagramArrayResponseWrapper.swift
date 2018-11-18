//
//  InstagramArrayResponseWrapper.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.

import Foundation

struct InstagramPhotosResponseWrapper: Decodable {
    let instagramPhotos: [InstagramPhoto]

    enum CodingKeys: String, CodingKey {
        case instagramPhotos = "data"
    }
}
