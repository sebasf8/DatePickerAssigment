//
//  MockCompanyService.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation

class MockCompanyService: CompanyProvider {
    func fetchCompany() -> CompanyModel {
        CompanyModel(name: "")
    }
}
