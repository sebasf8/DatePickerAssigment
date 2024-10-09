//
//  CompanyService.swift
//  DatePickerAssigment
//
//  Created by Sebastian Fernandez on 25/9/24.
//

import Foundation

class CompanyService: CompanyProvider {
    private lazy var coreDataStack = DependencyContainer.shared.coreDataStack

    func fetchCompany() -> CompanyModel {
        do {
            let company = try? coreDataStack.persistentContainer.viewContext.fetch(Company.fetchRequest()).first

            guard let company else {
                return CompanyModel(name: try insertCompany().name ?? "")
            }

            return CompanyModel(name: company.name ?? "")
        } catch {
            DependencyContainer.shared.logger.log(error)
            return CompanyModel(name: "")
        }
    }
}

private extension CompanyService {
    func insertCompany() throws -> Company {
        let company = Company(context: coreDataStack.persistentContainer.viewContext)
        company.name = "Apple"

        try coreDataStack.save()

        return company
    }
}
