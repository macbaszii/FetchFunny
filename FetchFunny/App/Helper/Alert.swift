//
//  Alert.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 16/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

extension UIAlertController {
    func showAlert(title: String?,
                   message: String?,
                   proceedButtonTitle: String?,
                   cancelButtonTitle: String?,
                   proceedCompletion: (() -> Void)?,
                   cancelCompletion: (() -> Void)?) -> UIAlertController {

        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let proceedAction = UIAlertAction(
            title: proceedButtonTitle,
            style: .default) { _ in
                proceedCompletion?()
        }
        alert.addAction(proceedAction)

        if let cancelButtonTitle = cancelButtonTitle {
            let cancelaction = UIAlertAction(
                title: cancelButtonTitle,
                style: .cancel) { _ in
                    cancelCompletion?()
            }
            alert.addAction(cancelaction)
        }

        return alert
    }
}
