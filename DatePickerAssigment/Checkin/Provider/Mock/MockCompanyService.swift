//
//  MockCompanyService.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation

class MockCompanyService: CompanyProvider {
    func fetchCompany() throws -> CompanyModel {
        CompanyModel(name: "")
    }
}
