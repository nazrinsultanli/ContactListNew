//
//  MockData.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 19.04.24.
//

import Foundation
import CoreData
import UIKit

class MockData {
   
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let context = AppDelegate().persistentContainer.viewContext
    func generateMockData() -> [ContactDataStruct] {
        var mockData: [ContactDataStruct] = []
        
        let names = ["James", "John", "Robert", "Michael", "William", "David", "Richard", "Joseph", "Charles", "Thomas", "Daniel", "Matthew", "Anthony", "Donald", "Steven", "Paul", "Andrew", "Joshua", "Kenneth", "Kevin"]
    
        let surnames = ["Smith", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Rodriguez", "Martinez", "Hernandez", "Lopez", "Gonzalez", "Wilson", "Anderson", "Thomas", "Taylor", "Moore", "Jackson", "Martin"]
        
        let initialData = [
            ContactDataStruct(name: "Nazrin", surname: "Dolkhanova", number: "9948518000000", company: "Kapital Bank", photo: ""),
            ContactDataStruct(name: "Ali", surname: "Jafarov", number: "9948518000888", company: "Kapital Bank", photo: "")
        ]
        
        mockData += initialData
        
        for _ in 1...28 {
            let name = names.randomElement() ?? "Unknown"
            let surname = surnames.randomElement() ?? "Unknown"
            let number = "\(Int64.random(in: 9948518000000..<9948518009999))"
            let company = "Company"
            
            let contact = ContactDataStruct(name: name, surname: surname, number: number, company: company, photo: "")
            mockData.append(contact)
        }
        
        return mockData
    }

    func saveItems(item : ContactDataStruct) {
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
    
    func storeToDataBase() {
        let mockdata = generateMockData()
        for i in mockdata {
            saveItems(item: i)
        }
    }
    
//    
//    init(){
//        storeToDataBase()
//    }

}
