//
//  PhotoCell.swift
//  FetchFunny
//
//  Created by Anoochitarom, Kiattisak (Agoda) on 18/11/2561 BE.
//  Copyright © 2561 Anoochitarom, Kiattisak (Agoda). All rights reserved.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(with viewModel: PhotoCellViewModel) {
        guard let url = URL(string: viewModel.urlString) else { return }
        imageView.kf.setImage(with: url)
    }
}

struct PhotoCellViewModel {
    let urlString: String
}
