//
//  CaseEntity+CoreDataProperties.swift
//  Covid19App
//
//  Created by oleg on 29.11.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//
//

import Foundation
import CoreData


extension CaseEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CaseEntity> {
        return NSFetchRequest<CaseEntity>(entityName: "CaseEntity")
    }

    @NSManaged public var country: String?
    @NSManaged public var cases: Int32
    @NSManaged public var todayCases: Int32
    @NSManaged public var deaths: Int32
    @NSManaged public var todayDeaths: Int32
    @NSManaged public var recovered: Int32
    @NSManaged public var active: Int32
    @NSManaged public var critical: Int32
    @NSManaged public var casesPerOneMillion: Int32
    @NSManaged public var deathsPerOneMillion: Int32
    @NSManaged public var totalTests: Int32
    @NSManaged public var testsPerOneMillion: Int32

}

extension CaseEntity : Identifiable {

}
