//
//  ContactListViewModel.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 19.04.24.
//

import Foundation
import CoreData
import UIKit
class ContactListViewModel {
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var context = appDelegate.persistentContainer.viewContext
    
    var array = [String: [ContactData]]() // Dictionary to store contacts by section
    var sectionTitles = [String]() // Array to store section titles
    

    func fetchItemsfromDataBase(completion: ()->()) {
        do {
            let contacts = try context.fetch(ContactData.fetchRequest()) as! [ContactData]
            array.removeAll() // Clear existing data
            sectionTitles.removeAll()
            for contact in contacts {
                let firstLetter = String(contact.name!.prefix(1)).uppercased()
                if array[firstLetter] == nil {
                    array[firstLetter] = [contact]
                    sectionTitles.append(firstLetter)
                } else {
                    array[firstLetter]?.append(contact)
                }
            }
            // Sort sectionTitles array
            sectionTitles.sort()
            completion()
        } catch {
            print(error.localizedDescription)
        }
    }
}
