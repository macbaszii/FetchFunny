//
//  PhotoDetailsModule.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol PhotoDetailsViewInput: class {
    func setCaption(_ text: String)
    func setImage(url: URL?, appropriateHeight: Double)
}

protocol PhotoDetailsViewOutput {
    func viewIsReady()
}
