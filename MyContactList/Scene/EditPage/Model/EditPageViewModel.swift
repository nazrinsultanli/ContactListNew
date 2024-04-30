//
//  EditPageViewModel.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 30.04.24.
//

import Foundation
enum EditPageItemType {
    case ContactPoster
    case phone(String?)
    case FaceTime
    case notes
    case sendShareAdd
    case emergency
    case block
}

enum SegmentNames: String , CaseIterable {
    case contactPoster = "Contact Photo & Poster"
    case phone = "phone"
    case faceTime = "FaceTime"
    case notes = "Notes"
    case sendShareAdd = "Send Message,Share Contact, Add to Favorites"
    case emergency = "Add to Emergency Contacts"
    case block = "Block Caller"
}
