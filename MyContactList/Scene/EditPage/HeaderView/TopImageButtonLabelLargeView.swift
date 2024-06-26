//
//  TopImageButtonLabelLargeView.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 23.04.24.
//

import UIKit

class TopImageButtonLabelLargeView: UIView {
    private let name: String
    private let surname: String
    private let personImage: String
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let NSView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 50
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var NSPrefixLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.text = String(name.prefix(1)) + String(surname.prefix(1))
        label.font = UIFont.systemFont(ofSize: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .white
        label.textColor = .white
        return label
    }()
    
    
    private lazy var titleName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.text = name + " " + surname
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .white
        label.textColor = .white
        return label
    }()
    
    
    init(name: String, surname: String, personImage: String, frame: CGRect) {
        self.name = name
        self.surname = surname
        self.personImage = personImage
        super.init(frame: frame)
        layout()
        
        backgroundView.backgroundColor = .systemGray
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {

        addSubview(backgroundView)
        addSubview(NSView)
        addSubview(titleName)
        addSubview(NSPrefixLabel)
        
        
        // stack 60
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            

            NSView.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            NSView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            NSView.widthAnchor.constraint(equalToConstant: 100),
            NSView.heightAnchor.constraint(equalToConstant: 100),
            
            
            NSPrefixLabel.topAnchor.constraint(equalTo: NSView.topAnchor),
            NSPrefixLabel.leadingAnchor.constraint(equalTo: NSView.leadingAnchor),
            NSPrefixLabel.trailingAnchor.constraint(equalTo: NSView.trailingAnchor),
            NSPrefixLabel.bottomAnchor.constraint(equalTo: NSView.bottomAnchor),

            titleName.topAnchor.constraint(equalTo: NSView.bottomAnchor),
            titleName.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            titleName.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 0)
        ])

    }
}
