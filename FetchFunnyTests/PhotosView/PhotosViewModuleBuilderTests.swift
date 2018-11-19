//
//  PhotosViewModuleBuilderTests.swift
//  FetchFunnyTests
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import XCTest

@testable import FetchFunny

final class PhotosViewModuleBuilderTests: XCTestCase {
    func testBuildModule() {
        let builder = PhotosViewModuleBuilder()

        guard let viewController = builder.build() as? PhotosViewController else {
            return XCTFail("Couldn't build PhotosViewController")
        }

        XCTAssertNotNil(viewController.output)
        XCTAssertNotNil(viewController.dataSource)

        guard let presenter = viewController.output as? PhotosViewPresenter else {
            return XCTFail("PhotosViewPresenter isn't set correctly")
        }

        XCTAssertNotNil(presenter.interactor)
        XCTAssertNotNil(presenter.view)
        XCTAssertNotNil(presenter.router)

        guard let interactor = presenter.interactor as? PhotosViewInteractor else {
            return XCTFail("PhotosViewInteractor isn't set correctly")
        }

        XCTAssertNotNil(interactor.output)

        guard let router = presenter.router as? PhotosViewRouter else {
            return XCTFail("PhotosViewRouter isn't set correctly")
        }

        XCTAssertNotNil(router.viewController)
    }
}
