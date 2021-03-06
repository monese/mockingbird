//
//  ExceptionsStubbableTests.swift
//  MockingbirdTests
//
//  Created by Andrew Chang on 9/14/19.
//

import Foundation
import Mockingbird
@testable import MockingbirdTestsHost

// MARK: - Stubbable declarations

private protocol StubbableThrowingProtocol: Mock {
  func throwingMethod() throws -> Mockable<MethodDeclaration, () throws -> Void, Void>
  func throwingMethod() throws -> Mockable<MethodDeclaration, () throws -> Bool, Bool>
  func throwingMethod(block: @escaping @autoclosure () -> () throws -> Bool) throws
    -> Mockable<MethodDeclaration, (() throws -> Bool) throws -> Void, Void>
}
extension ThrowingProtocolMock: StubbableThrowingProtocol {}

private protocol StubbableRethrowingProtocol: RethrowingProtocol, Mock {
  func rethrowingMethod(block: @escaping @autoclosure () -> () throws -> Bool)
    -> Mockable<MethodDeclaration, (() throws -> Bool) -> Void, Void>
  func rethrowingMethod(block: @escaping @autoclosure () -> () throws -> Bool)
    -> Mockable<MethodDeclaration, (() throws -> Bool) -> Bool, Bool>
}
extension RethrowingProtocolMock: StubbableRethrowingProtocol {}
