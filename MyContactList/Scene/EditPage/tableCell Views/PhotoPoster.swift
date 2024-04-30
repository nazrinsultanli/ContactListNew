//
//  photoPoster.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 30.04.24.
//

import UIKit

class PhotoPoster: UIView {
    var name: String {
        didSet {
            NSPrefixLabel.text = "\(name.prefix(1))\(surname.prefix(1))"
        }
    }
    var surname: String {
        didSet {
            NSPrefixLabel.text = "\(name.prefix(1))\(surname.prefix(1))"
        }
    }
    var personImage: String
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let NSView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 30
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var NSPrefixLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var titleName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contact Photo & Poster"
        return label
    }()
    
    init(name: String, surname: String, personImage: String, frame: CGRect) {
        self.name = name
        self.surname = surname
        self.personImage = personImage
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(backgroundView)
        addSubview(NSView)
        addSubview(NSPrefixLabel)
        addSubview(titleName)
        //80
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            NSView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            NSView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            NSView.widthAnchor.constraint(equalToConstant: 60),
//            NSView.heightAnchor.constraint(equalToConstant: 40),
            NSView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),

            
            
            NSPrefixLabel.centerXAnchor.constraint(equalTo: NSView.centerXAnchor),
            NSPrefixLabel.centerYAnchor.constraint(equalTo: NSView.centerYAnchor),
            
            titleName.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            titleName.leadingAnchor.constraint(equalTo: NSView.trailingAnchor, constant: 10),
            titleName.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
        ])
    }
}
