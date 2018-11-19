//
//  PhotoCellTests.swift
//  FetchFunnyTests
//
//  Created by Kiattisak Anoochitarom on 19/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import XCTest

@testable import FetchFunny

final class PhotoCellTests: XCTestCase {
    func testConfigureCell() {
        var cell: PhotoCell?

        do  {
            cell = try PhotoCell.loadFromNib()
        } catch {
            XCTFail("Couldn't load PhotoCell from nib file")
        }

        let expectedURL = "https://www.google.com/image.png"
        let viewModel = PhotoCellViewModel(urlString: expectedURL)
        let imageViewURLLoadable = MockImageViewURLLoadable()

        cell?.imageViewURLLoadable = imageViewURLLoadable
        cell?.configureCell(with: viewModel)

        XCTAssertTrue(imageViewURLLoadable.isCalledWithParameter(.setImageView(url: URL(string: expectedURL))))
    }
}
