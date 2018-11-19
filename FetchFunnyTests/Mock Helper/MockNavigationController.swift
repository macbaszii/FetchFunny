//
//  MockNavigationController.swift
//  FetchFunnyTests
//
//  Created by Anoochitarom, Kiattisak (Agoda) on 19/11/2561 BE.
//  Copyright © 2561 Anoochitarom, Kiattisak (Agoda). All rights reserved.
//

import UIKit

final class MockNavigationController: UINavigationController, MockInvocable {
    enum Invocation: MockInvocationEnum {
        case pushViewController
        case popToViewController
        case popToRootViewController
        case popViewController
    }

    var invocations: [Invocation] = []

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        invocations.append(.pushViewController)
    }

    override func popToViewController(_ viewController: UIViewController,
                                      animated: Bool) -> [UIViewController]? {
        invocations.append(.popToViewController)
        return nil
    }

    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        invocations.append(.popToRootViewController)
        return nil
    }

    override func popViewController(animated: Bool) -> UIViewController? {
        invocations.append(.popViewController)
        return nil
    }
}
