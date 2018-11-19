//
//  PhotoCell.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class PhotoCell: UICollectionViewCell, NibLoadable {
    typealias NibRootType = PhotoCell

    @IBOutlet weak var imageView: UIImageView!

    var imageViewURLLoadable: ImageViewURLLoadable?

    func configureCell(with viewModel: PhotoCellViewModel) {
        guard let imageViewURLLoadable = self.imageViewURLLoadable,
            let url = URL(string: viewModel.urlString) else { return }
        imageViewURLLoadable.setImageView(imageView, with: url)
    }
}

struct PhotoCellViewModel {
    let urlString: String
}
