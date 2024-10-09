//
//  MainDependencyContainer.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

@objc class DependencyContainer: NSObject {
    static private(set)var shared: Container = ProductionContainer()

    override private init() {}

    static func registerDependencies(container: Container) {
        DependencyContainer.shared = container
    }
}
