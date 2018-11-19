//
//  PhotoDetailsViewController.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class PhotoDetailsViewController: UIViewController, NibLoadable, PhotoDetailsViewInput {
    typealias NibRootType = PhotoDetailsViewController

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!

    var output: PhotoDetailsViewOutput?
    var imageViewURLLoadable: ImageViewURLLoadable?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }

    func setCaption(_ text: String) {
        captionLabel.text = text
    }

    func setImage(url: URL?, appropriateHeight: Double) {
        imageViewURLLoadable?.setImageView(imageView, with: url)
        imageViewHeightConstraint.constant = CGFloat(appropriateHeight)
    }
}
