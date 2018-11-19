//
//  PhotoDetailsPresenterTests.swift
//  FetchFunnyTests
//
//  Created by Anoochitarom, Kiattisak (Agoda) on 19/11/2561 BE.
//  Copyright © 2561 Anoochitarom, Kiattisak (Agoda). All rights reserved.
//

import XCTest
import UIKit

@testable import FetchFunny

class PhotoDetailsViewPresenterTests: XCTestCase {
    var presenter: PhotoDetailsViewPresenter!
    var view: MockPhotoDetailsViewInput!

    override func setUp() {
        super.setUp()

        view = MockPhotoDetailsViewInput()
        presenter = PhotoDetailsViewPresenter(with: InstagramPhoto.mockInstagramPhoto)

        presenter.view = view
    }

    override func tearDown() {
        presenter = nil
        view = nil

        super.tearDown()
    }

    func testViewIsReady() {
        let image = InstagramPhoto.mockInstagramPhoto.multiResolutionImage.standardResolution
        let screenWidth = UIScreen.main.bounds.width

        let expectedText = InstagramPhoto.mockInstagramPhoto.caption.text
        let expectedURL = URL(string: image.url)
        let expectedHeight = screenWidth *
            CGFloat(image.height) /
            CGFloat(image.width)
        presenter.viewIsReady()

        XCTAssertTrue(view.isCalledWithParameter(.setCaption(test: expectedText)))
        XCTAssertTrue(view.isCalledWithParameter(.setImage(url: expectedURL, height: Double(expectedHeight))))
    }
}
