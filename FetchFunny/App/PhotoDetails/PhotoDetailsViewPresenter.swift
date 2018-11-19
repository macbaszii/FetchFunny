//
//  PhotoDetailsViewPresenter.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class PhotoDetailsViewPresenter: PhotoDetailsViewOutput {
    weak var view: PhotoDetailsViewInput?

    let photo: InstagramPhoto

    init(with photo: InstagramPhoto) {
        self.photo = photo
    }

    func viewIsReady() {
        view?.setCaption(photo.caption.text)

        guard let imageURL = URL(string: photo.multiResolutionImage.standardResolution.url) else { return }

        let screenWidth = UIScreen.main.bounds.width
        let appropriateHeight = screenWidth *
            CGFloat(photo.multiResolutionImage.standardResolution.height) /
            CGFloat(photo.multiResolutionImage.standardResolution.width)

        view?.setImage(
            url: imageURL,
            appropriateHeight: Double(appropriateHeight)
        )
    }
}
