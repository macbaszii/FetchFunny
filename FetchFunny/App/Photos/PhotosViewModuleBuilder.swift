//
//  PhotosViewModuleBuilder.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

protocol PhotosViewModuleBuildable {
    func build() -> UIViewController
}

final class PhotosViewModuleBuilder: PhotosViewModuleBuildable {
    func build() -> UIViewController {
        guard let photosViewController = try? PhotosViewController.loadFromNib() else {
            fatalError("Could not load PhotosViewController from nib file")
        }

        return photosViewController
    }
}
