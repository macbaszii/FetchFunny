//
//  PhotosViewPresenterTests.swift
//  FetchFunnyTests
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import XCTest

@testable import FetchFunny

final class PhotosViewPresenterTests: XCTestCase {
    var presenter: PhotosViewPresenter!
    var alertManager: MockAlertManager!
    var view: MockPhotosViewInput!
    var interactor: MockPhotosViewInteractorInput!
    var router: MockPhotosViewRouterInput!

    override func setUp() {
        super.setUp()

        alertManager = MockAlertManager()
        view = MockPhotosViewInput()
        interactor = MockPhotosViewInteractorInput()
        router = MockPhotosViewRouterInput()

        presenter = PhotosViewPresenter(with: alertManager)
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        presenter.photos = [InstagramPhoto.mockInstagramPhoto]
    }

    override func tearDown() {
        presenter = nil
        alertManager = nil
        view = nil
        interactor = nil
        router = nil

        super.tearDown()
    }

    func testViewIsReady() {
        presenter.viewIsReady()

        XCTAssertTrue(view.isCalled(.showLoadingView))
        XCTAssertTrue(interactor.isCalled(.loadMyPhotos))
    }

    func testFetchPhotos() {
        let expectedSearchText = "sample"

        presenter.fetchPhotos(with: expectedSearchText)

        XCTAssertTrue(view.isCalled(.showLoadingView))
        XCTAssertTrue(interactor.isCalledWithParameter(.loadPhotos(string: expectedSearchText)))
    }

    func testTapPhoto() {
        presenter.tapPhoto(at: IndexPath(item: 0, section: 0))

        XCTAssertTrue(router.isCalled(.navigateToPhotoDetails))
    }
}
