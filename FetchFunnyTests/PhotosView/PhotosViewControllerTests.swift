//
//  PhotosViewControllerTests.swift
//  FetchFunnyTests
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import XCTest

@testable import FetchFunny

class PhotosViewControllerTests: XCTestCase {
    var viewController: PhotosViewController!
    var output: MockPhotosViewOutput!

    override func setUp() {
        super.setUp()

        output = MockPhotosViewOutput()

        do {
            viewController = try PhotosViewController.loadFromNib()
        } catch {
            XCTFail("Couldn't load PhotosViewController from nib file")
        }

        viewController.output = output
        XCTAssertNotNil(viewController.view)
    }

    override func tearDown() {
        viewController = nil
        output = nil

        super.tearDown()
    }

    func testViewDidLoad() {
        // -viewDidLoad is automatically called at line `XCTAssertNotNil(viewController.view)`

        XCTAssertTrue(output.isCalled(.viewIsReady))
        XCTAssertTrue(viewController.activityIndicator.hidesWhenStopped)
        XCTAssertTrue(viewController.loadingView.isHidden)
        XCTAssertNotNil(viewController.collectionView.dataSource)
        XCTAssertNotNil(viewController.collectionView.delegate)
        XCTAssertTrue(viewController.collectionView.alwaysBounceVertical)
        XCTAssertEqual(viewController.collectionView.backgroundColor, .white)
    }

    func testShowLoadingView() {
        viewController.showLoadingView()

        XCTAssertFalse(viewController.loadingView.isHidden)
    }

    func testHideLoadingView() {
        viewController.hideLoadingView()

        XCTAssertTrue(viewController.loadingView.isHidden)
    }
}
