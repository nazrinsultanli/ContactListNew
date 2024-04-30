//
//  DetailMobileUIView.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 30.04.24.
//

import UIKit

class DetailMobileUIView: UIView {
    var number: String {
        didSet {
            numberLabel.text = number
        }
    }

    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private lazy var mobileLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.text = "mobile"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .blue
        label.text = number
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(number: String, frame: CGRect) {
        self.number = number
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundView.backgroundColor = .white
        addSubview(backgroundView)
        addSubview(mobileLabel)
        addSubview(numberLabel)
        
        
        // stack 60
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            mobileLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            mobileLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            mobileLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 20),
            mobileLabel.heightAnchor.constraint(equalToConstant: 20),
            
            numberLabel.topAnchor.constraint(equalTo: mobileLabel.bottomAnchor, constant: 10),
            numberLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            numberLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 20),
            numberLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
        ])
        
    }
}
