//
//  EditPageHeaderView.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 23.04.24.
//


import UIKit


class EditPageHeaderView: UITableViewHeaderFooterView {
    
    static let reuseID = "EditPageHeaderView"
    
    private let titleUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [TopImageButtonLabelView(title: "message",
                                                                               imageName: "message.fill"),
                                                       TopImageButtonLabelView(title: "call",
                                                                               imageName: "phone.fill"),
                                                       TopImageButtonLabelView(title: "video",
                                                                               imageName: "video.fill"),
                                                       TopImageButtonLabelView(title: "mail",
                                                                               imageName: "envelope.fill")]
        )
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureContraints() {
        addSubview(titleUIView)
        addSubview(hStackView)
        
        NSLayoutConstraint.activate([
            titleUIView.topAnchor.constraint(equalTo: topAnchor),
            titleUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            titleUIView.heightAnchor.constraint(equalToConstant: 100),
            
            hStackView.topAnchor.constraint(equalTo: titleUIView.bottomAnchor, constant: 5),
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            hStackView.heightAnchor.constraint(equalToConstant: 60),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),

        ])
    }
    
}

