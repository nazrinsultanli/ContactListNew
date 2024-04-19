//
//  ContactDataManager.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 19.04.24.
//

import Foundation
import UIKit
import CoreData
class ContactDataManager {
    private init() {
        fetchItemsfromDataBase()
    }
    
    static let shared = ContactDataManager()
    var array = [ContactData]()

    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var context = appDelegate.persistentContainer.viewContext
    
    func fetchItemsfromDataBase() {
        do {
            array = try context.fetch(ContactData.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addNewItem(item: ContactData) {
        do {
            let model = ContactData(context: context)
            model.name = item.name
            model.surname = item.surname
            model.number = item.number
            model.company = item.company
            model.photo = item.photo
            model.id = item.id
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func editExistedItem(item: ContactData) {
        
        do {
            let model = ContactData(context: context)
            model.name = item.name
            model.surname = item.surname
            model.number = item.number
            model.company = item.company
            model.photo = item.photo
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
