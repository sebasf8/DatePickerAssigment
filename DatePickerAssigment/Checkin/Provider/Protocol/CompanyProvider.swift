//
//  CompanyProvider.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation

protocol CompanyProvider {
    func fetchCompany() throws -> CompanyModel
}
