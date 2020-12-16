//
//  GlobalCaseEntity+CoreDataProperties.swift
//  Covid19App
//
//  Created by oleg on 29.11.2020.
//  Copyright © 2020 covid19app. All rights reserved.
//
//

import Foundation
import CoreData


extension GlobalCaseEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GlobalCaseEntity> {
        return NSFetchRequest<GlobalCaseEntity>(entityName: "GlobalCaseEntity")
    }

    @NSManaged public var cases: Int32
    @NSManaged public var deaths: Int32
    @NSManaged public var recovered: Int32
    
}

extension GlobalCaseEntity : Identifiable {

}
