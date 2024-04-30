//
//  DetailNotesUIView.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 30.04.24.
//

import UIKit

class DetailNotesUIView: UIView {

    var notesText: String {
        didSet {
            notesLabelText.text = notesText
        }
    }

    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private lazy var notesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Notes"
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var notesLabelText: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .blue
        label.text = notesText
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    init(notesText: String, frame: CGRect) {
        self.notesText = notesText
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        backgroundView.backgroundColor = .white
        addSubview(backgroundView)
        addSubview(notesLabel)
        addSubview(notesLabelText)
        
        
        // stack 60
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            notesLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            notesLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            notesLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 20),
            notesLabel.heightAnchor.constraint(equalToConstant: 20),
            
            notesLabelText.topAnchor.constraint(equalTo: notesLabel.bottomAnchor, constant: 10),
            notesLabelText.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 20),
            notesLabelText.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 20),
            notesLabelText.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
        ])
        
    }
}
