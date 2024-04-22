//
//  SearchResultViewModel.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 19.04.24.
//

import Foundation
import UIKit
class SearchResultViewModel {
//    var filteredArrray = [ContactData]()
    
    var searchedText: String
    
    init(searchedText: String) {
        self.searchedText = searchedText
    }
    
    func searchContacts() -> [ContactData] {
        let searchText = searchedText.lowercased()
        if searchText.isEmpty {
            return ContactDataManager.shared.array
        } else {
            return ContactDataManager.shared.array.filter({ $0.name?.lowercased().contains(searchText) ?? false || $0.surname?.lowercased().contains(searchText) ?? false })
            //            return ContactDataManager.shared.array.filter { contact in
            //                let nameMatch = contact.name?.lowercased().contains(searchText)
            //                let surnameMatch = contact.surname?.lowercased().contains(searchText)
            //                return (nameMatch ?? []) || (surnameMatch ?? [])
        }
    }
}
