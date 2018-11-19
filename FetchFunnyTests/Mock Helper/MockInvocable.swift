//
//  MockInvocable.swift
//  FetchFunnyTests
//
//  Created by Kiattisak Anoochitarom on 18/11/2561 BE.
//  Copyright © 2018 Kiattisak A. All rights reserved.
//

import Foundation

public protocol MockInvocable {

    associatedtype InvocationType

    var invocations: [InvocationType] { get set }

    mutating func reset()
    func isCalled(_ invocation: InvocationType, times: Int) -> Bool
    func isCalledWithParameter(_ invocation: InvocationType, times: Int) -> Bool
    func isExactOrder(invocations: [InvocationType]) -> Bool
}

public extension MockInvocable where InvocationType: MockInvocationEnum {

    public mutating func reset() {
        invocations.removeAll()
    }

    public func isCalled(_ invocation: InvocationType, times: Int = 1) -> Bool {
        return invocations.filter { $0 ~= invocation }.count == times
    }

    public func isCalledWithParameter(_ invocation: InvocationType, times: Int = 1) -> Bool {
        return invocations.filter { $0 == invocation }.count == times
    }

    public func isExactOrder(invocations: [InvocationType]) -> Bool {
        return self.invocations == invocations
    }
}

public protocol MockInvocationEnum: RawRepresentable, Hashable {}

public extension MockInvocationEnum {

    public init?(rawValue: RawValue) { return nil }

    public var rawValue: String {
        return "\(self)"
    }

    public var rawValueWithoutParameter: String {
        guard let range = rawValue.range(of: "(") else { return String(rawValue) }
        let result = String(rawValue[..<range.lowerBound])
        return result
    }

    public static func ~= (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValueWithoutParameter == rhs.rawValueWithoutParameter
    }

    public var hashValue: Int {
        return rawValue.hashValue
    }
}

protocol MockInvocation: Equatable {}

protocol Mock {
    associatedtype InvocationType: Equatable
    var invocations: [InvocationType] { get }
}

func ==<T: MockInvocation>(l: T?, r: T) -> Bool {
    guard case let .some(l) = l else {
        return false
    }

    return l == r
}
