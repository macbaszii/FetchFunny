//
//  PhotosViewRouterTests.swift
//  FetchFunnyTests
//
//  Created by Anoochitarom, Kiattisak (Agoda) on 19/11/2561 BE.
//  Copyright © 2561 Anoochitarom, Kiattisak (Agoda). All rights reserved.
//

import XCTest
import UIKit

@testable import FetchFunny

class PhotosViewRouterTests: XCTestCase {
    func testPhotoDetailsNavigation() {
        let detailsBuilder = MockPhotoDetailsModuleBuilder()
        let viewController = UIViewController()
        let navigationController = MockNavigationController(
            rootViewController: viewController
        )
        let router = PhotosViewRouter(
            detailsBuilder: detailsBuilder
        )
        router.viewController = viewController

        router.navigateToPhotoDetails(for: InstagramPhoto.mockInstagramPhoto)

        XCTAssertTrue(detailsBuilder.isCalledWithParameter(.build(photo: InstagramPhoto.mockInstagramPhoto)))
        XCTAssertTrue(navigationController.isCalled(.pushViewController))
    }
}
