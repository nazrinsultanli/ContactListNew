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
    init(searchedText: String) {
        self.searchedText = searchedText
    }
    var searchedText: String = ""
    
    func searchContacts() -> [ContactData] {
        let searchText = searchedText.lowercased()
        return ContactDataManager.shared.array.filter { contact in
            let nameMatch = contact.name?.lowercased().contains(searchText)
            let surnameMatch = contact.surname?.lowercased().contains(searchText)
            return nameMatch! || (surnameMatch != nil)
        }
    }
    
    
}
