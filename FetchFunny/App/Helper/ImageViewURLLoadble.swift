//
//  ImageViewURLLoadble.swift
//  FetchFunny
//
//  Created by Anoochitarom, Kiattisak (Agoda) on 19/11/2561 BE.
//  Copyright © 2561 Anoochitarom, Kiattisak (Agoda). All rights reserved.
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
