//
//  Photo.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

enum MediaType: String {
    case image
    case video
}

struct Image: Codable {
    let url: String
    let width: Int
    let height: Int
}

struct MultiResolutionImage: Codable {
    let thumbnail: Image
    let lowResolution: Image
    let standardResolution: Image

    enum CodingKeys: String, CodingKey {
        case thumbnail
        case lowResolution = "low_resolution"
        case standardResolution = "standard_resolution"
    }
}

struct PhotoCaption: Codable {
    let createdTime: String
    let text: String

    enum CodingKeys: String, CodingKey {
        case createdTime = "created_time"
        case text
    }
}

struct PhotoUser: Codable {
    let username: String
}

struct InstagramPhoto: Codable {
    let id: String
    let type: String
    let user: PhotoUser
    let caption: PhotoCaption
    let multiResolutionImage: MultiResolutionImage

    enum CodingKeys: String, CodingKey {
        case id
        case type
        case user
        case caption
        case multiResolutionImage = "images"
    }
}
