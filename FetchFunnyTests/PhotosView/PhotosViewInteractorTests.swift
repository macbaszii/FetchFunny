//
//  PhotosViewInteractorTests.swift
//  FetchFunnyTests
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import XCTest

@testable import FetchFunny

class PhotosViewInteractorTests: XCTestCase {
    var interactor: PhotosViewInteractor!
    var instagramManager: MockInstagramManager!
    var output: MockPhotosViewInteractorOutput!

    override func setUp() {
        super.setUp()

        instagramManager = MockInstagramManager()
        output = MockPhotosViewInteractorOutput()

        interactor = PhotosViewInteractor(
            instagramManager: instagramManager
        )

        interactor.output = output

        XCTAssertTrue(instagramManager.isCalled(.setDelegate(delegate: interactor)))
    }

    override func tearDown() {
        interactor = nil
        instagramManager = nil
        output = nil

        super.tearDown()
    }

    func testloadMyPhotos() {
        interactor.loadMyPhotos()

        XCTAssertTrue(instagramManager.isCalled(.loadMyRecentPhotos(photosModuleInput: nil)))
    }

    func testDidReceiveMyRecentPhotos() {
        interactor.didReceiveMyRecentPhotos([InstagramPhoto.mockInstagramPhoto])

        XCTAssertTrue(output.isCalledWithParameter(.didReceivePhotos(photos: [InstagramPhoto.mockInstagramPhoto])))
    }

    func testDidReceiveFailureRequest() {
        interactor.didReceiveFailureRequest(errorMessage: instagramManager.expectedErrorMessage)

        XCTAssertTrue(output.isCalledWithParameter(.didReceiveErrorRequest(errorMessage: instagramManager.expectedErrorMessage)))
    }
}
