//
//  InstagramLoginPresenter.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class InstagramLoginPresenter: InstagramLoginViewOutput,
                                     InstagramLoginInteractorOutput {
    var view: InstagramLoginViewInput?
    var router: InstagramLoginRouterInput?
    var interactor: InstagramLoginInteractorInput?

    func viewIsReady() {
        
    }

    func loginButtonTapped() {
        interactor?.createAuthoirizationURLForInstagram()
    }

    func didReceiveAuthorizationURL(_ url: URL) {
        router?.presentAuthorizationScreen(
            with: url,
            webViewDelegate: self
        )
    }

    func didStoreAccessToken() {
        guard let application = UIApplication.shared.delegate as? AppDelegate else { return }
        application.applicationDelegateHelper?.rootToPhotosScreen()
    }
}

extension InstagramLoginPresenter: WebViewControllerDelegate {
    func didReceiveResultURL(_ url: URL) {
        interactor?.storeAccessToken(from: url)
    }
}