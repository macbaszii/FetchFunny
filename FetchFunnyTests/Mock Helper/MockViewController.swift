//
//  MockViewController.swift
//  FetchFunnyTests
//
//  Created by Anoochitarom, Kiattisak (Agoda) on 19/11/2561 BE.
//  Copyright © 2561 Anoochitarom, Kiattisak (Agoda). All rights reserved.
//

import UIKit

final class MockViewController: UIViewController, MockInvocable {
    var invocations: [Invocation] = []

    enum Invocation: MockInvocationEnum {
        case present
        case dismiss
    }

    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        invocations.append(.present)
    }

    var presentCalled: (viewController: UIViewController, animated: Bool)?
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        invocations.append(.dismiss)
    }
}
