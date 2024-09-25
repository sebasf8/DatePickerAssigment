//
//  MainDependencyContainer.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

class DependencyContainer {
    static private(set)var shared: Container = ProductionContainer()

    private init() {}
    
    func registerDependencies(container: Container) {
        DependencyContainer.shared = container
    }
}
