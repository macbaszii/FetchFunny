//
//  PhotoDetailsViewControllerTests.swift
//  FetchFunnyTests
//
//  Created by Anoochitarom, Kiattisak (Agoda) on 19/11/2561 BE.
//  Copyright © 2561 Anoochitarom, Kiattisak (Agoda). All rights reserved.
//

import XCTest

@testable import FetchFunny

final class PhotoDetailsViewControllerTests: XCTestCase {
    var viewController: PhotoDetailsViewController!
    var output: MockPhotoDetailsViewOutput!
    var imageURLLoadable: MockImageViewURLLoadable!

    override func setUp() {
        super.setUp()

        output = MockPhotoDetailsViewOutput()
        imageURLLoadable = MockImageViewURLLoadable()

        do {
            viewController = try PhotoDetailsViewController.loadFromNib()
        } catch {
            XCTFail("Couldn't load PhotosViewController from nib file")
        }

        viewController.output = output
        viewController.imageViewURLLoadable = imageURLLoadable
        XCTAssertNotNil(viewController.view)
    }

    override func tearDown() {
        viewController = nil
        output = nil
        imageURLLoadable = nil

        super.tearDown()
    }

    func testViewDidLoad() {
        // -viewDidLoad is automatically called at line `XCTAssertNotNil(viewController.view)`

        XCTAssertTrue(output.isCalled(.viewIsReady))
    }

    func testSetCaption() {
        let expectedCaption = "sample caption"

        viewController.setCaption(expectedCaption)

        XCTAssertEqual(viewController.captionLabel.text, expectedCaption)
    }

    func testSetImageView() {
        let expectedURL = URL(string: "https://www.google.com/image.png")
        let expectedImageViewHeight = 100.0

        viewController.setImage(url: expectedURL, appropriateHeight: expectedImageViewHeight)

        XCTAssertTrue(imageURLLoadable.isCalledWithParameter(.setImageView(url: expectedURL)))
        XCTAssertEqual(viewController.imageViewHeightConstraint.constant, CGFloat(expectedImageViewHeight))
    }
}
