//
//  PhotoDetailsViewModuleMockObjects.swift
//  FetchFunnyTests
//
//  Created by Anoochitarom, Kiattisak (Agoda) on 19/11/2561 BE.
//  Copyright © 2561 Anoochitarom, Kiattisak (Agoda). All rights reserved.
//

import UIKit

@testable import FetchFunny

final class MockPhotoDetailsViewInput: PhotoDetailsViewInput, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case setCaption(test: String)
        case setImage(url: URL?, height: Double)
    }

    func setCaption(_ text: String) {
        invocations.append(.setCaption(test: text))
    }

    func setImage(url: URL?, appropriateHeight: Double) {
        invocations.append(.setImage(url: url, height: appropriateHeight))
    }
}

final class MockPhotoDetailsViewOutput: PhotoDetailsViewOutput, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case viewIsReady
    }

    func viewIsReady() {
        invocations.append(.viewIsReady)
    }
}

final class MockImageViewURLLoadable: ImageViewURLLoadable, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case setImageView(url: URL?)
    }

    func setImageView(_ imageView: UIImageView, with url: URL?) {
        invocations.append(.setImageView(url: url))
    }
}
