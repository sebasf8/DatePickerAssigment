//
//  Dictionary.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 24/9/24.
//

import Foundation

extension Dictionary where Key == ObjectIdentifier {
    subscript<T>(key: T.Type) -> Value? {
        get { return self[ObjectIdentifier(T.self)] }
        set { self[ObjectIdentifier(T.self)] = newValue }
    }
}
