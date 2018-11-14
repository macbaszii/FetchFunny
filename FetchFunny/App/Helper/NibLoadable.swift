//
//  NibLoadable.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 14/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import UIKit

struct CouldNotLoadNib: Error { }

protocol NibLoadable {
    associatedtype NibRootType
    static func loadFromNib() throws -> NibRootType
}

extension NibLoadable where NibRootType: UIView {
    static func loadFromNib() throws -> NibRootType {
        let nibName = String(describing: self)
        let bundle = Bundle(for: NibRootType.self)
        guard let firstElement = bundle.loadNibNamed(nibName, owner: nil, options: nil)?.first as? NibRootType else {
            throw CouldNotLoadNib()
        }
        return firstElement
    }
}

extension NibLoadable where NibRootType: UIViewController {
    static func loadFromNib() throws -> NibRootType {
        let nibName = String(describing: self)
        let bundle = Bundle(for: NibRootType.self)
        let viewController = NibRootType(nibName: nibName, bundle: bundle)
        return viewController
    }
}
