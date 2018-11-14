//
//  InstagramAuthorizationScreenBuilder.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

final class InstagramAuthorizationScreenBuilder {
    func build(with url: URL) -> UIViewController {
        guard let authorizationScreen = try? InstagramAuthorizationViewController.loadFromNib()
            else {
                fatalError("Couldn't load InstagramAuthorizationViewController from nib file")
        }

        authorizationScreen.url = url

        return authorizationScreen
    }
}
