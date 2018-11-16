//
//  Result.swift
//  FetchFunny
//
//  Created by Kiattisak Anoochitarom on 16/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

public enum Result<Value> {

    case success(Value)
    case failure(Error)

    public init(_ error: Error) {
        self = .failure(error)
    }

    public init(_ value: Value) {
        self = .success(value)
    }

    public var isSuccess: Bool {
        switch self {
        case .success:
            return true

        case .failure:
            return false
        }
    }

    public var value: Value? {
        switch self {
        case .success(let value):
            return value

        case .failure:
            return nil
        }
    }

    public var error: Error? {
        switch self {
        case .success:
            return nil

        case .failure(let error):
            return error
        }
    }

}

public extension Result {

    func on(success: ((Value) -> Void)? = nil, failure: ((Error) -> Void)? = nil) {
        switch self {
        case .success(let value):
            success?(value)

        case .failure(let error):
            failure?(error)
        }
    }

}

public extension Result {

    func flatMap<T>(_ transform: (Value) -> Result<T>) -> Result<T> {
        switch self {
        case .success(let value):
            return transform(value)

        case .failure(let error):
            return .failure(error)
        }
    }

    func map<T>(_ transform: (Value) -> T) -> Result<T> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .failure(let error):
            return .failure(error)
        }
    }

}

extension Result where Value == Void {

    public init() {
        self = .success(())
    }

}
