//
//  Photo.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

struct Image: Codable {
    let url: String
    let width: Int
    let height: Int
}

struct Images: Codable {
    let thumbnail: Image
    let lowResolution: Image
    let standardResolution: Image

    enum CodingKeys: String, CodingKey {
        case thumbnail
        case lowResolution = "low_resolution"
        case standardResolution = "standard_resolution"
    }
}

struct InstagramPhoto: Codable {
    let id: String
    let imageURLs: Images

    enum CodingKeys: String, CodingKey {
        case id
        case imageURLs = "images"
    }
}
