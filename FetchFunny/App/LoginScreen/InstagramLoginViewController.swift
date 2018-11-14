//
//  InstagramLoginViewController.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

class InstagramLoginViewController: UIViewController, NibLoadable {
    typealias NibRootType = InstagramLoginViewController

    @IBOutlet weak var loginButton: UIButton!

    var output: InstagramLoginViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.viewIsReady()
    }

    @IBAction func loginButtonTapped(_ button: UIButton) {

    }
}
