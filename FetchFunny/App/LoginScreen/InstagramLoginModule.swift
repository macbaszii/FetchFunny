//
//  InstagramLoginModule.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol InstagramLoginViewInput {

}

protocol InstagramLoginViewOutput {
    func viewIsReady()
}

protocol InstagramLoginRouterInput {
    func presentAuthorizationScreen()
}
