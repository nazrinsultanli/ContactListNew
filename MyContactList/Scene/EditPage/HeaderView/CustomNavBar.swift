//
//  CustomNavigationBar.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 24.04.24.
//

import UIKit

class CustomNavBar: UINavigationBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        newSize.height = 100 // Set your desired height here
        return newSize
    }
}

