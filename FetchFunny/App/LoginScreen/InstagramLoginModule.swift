//
//  InstagramLoginModule.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

protocol InstagramLoginViewInput: class {
}

protocol InstagramLoginViewOutput {
    func viewIsReady()
    func loginButtonTapped()
}

protocol InstagramLoginInteractorInput {
    func createAuthoirizationURLForInstagram()
    func storeAccessToken(from url: URL)
}

protocol InstagramLoginInteractorOutput: class {
    func didReceiveAuthorizationURL(_ url: URL)
    func didStoreAccessToken()
}

protocol InstagramLoginRouterInput {
    func presentAuthorizationScreen(with url: URL,
                                    webViewDelegate: WebViewControllerDelegate)
}
