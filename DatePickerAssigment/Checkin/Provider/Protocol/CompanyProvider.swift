//
//  CompanyProvider.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation

@objc protocol CompanyProvider {

    func fetchCompany() -> CompanyModel
}
