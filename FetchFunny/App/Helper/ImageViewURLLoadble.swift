//
//  ImageViewURLLoadble.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 19/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Kingfisher

protocol ImageViewURLLoadable {
    func setImageView(_ imageView: UIImageView, with url: URL?)
}

final class ImageViewURLLoadableImplementation: ImageViewURLLoadable {
    func setImageView(_ imageView: UIImageView, with url: URL?) {
        imageView.kf.setImage(with: url)
    }
}
