//
//  ContactData+CoreDataProperties.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 19.04.24.
//
//

import Foundation
import CoreData


extension ContactData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactData> {
        return NSFetchRequest<ContactData>(entityName: "ContactData")
    }

    @NSManaged public var company: String?
    @NSManaged public var name: String?
    @NSManaged public var number: String?
    @NSManaged public var photo: String?
    @NSManaged public var surname: String?
    @NSManaged public var id: UUID?

}

extension ContactData : Identifiable {

}
