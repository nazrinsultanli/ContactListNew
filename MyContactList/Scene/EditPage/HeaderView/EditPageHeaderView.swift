//
//  EditPageHeaderView.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 23.04.24.
//


import UIKit

enum ContactActions {
    case messages
    case call
    case video
    case mail
    
    var title: String{
        switch self {
        case .messages:
            return  "message"
        case .call:
            return "call"
        case .video:
            return "video"
        case .mail:
            return "mail"
        }
    }
    var imageName: String {
        switch self {
        case .messages:
            return  "message.fill"
        case .call:
            return "phone.fill"
        case .video:
            return "video.fill"
        case .mail:
            return "envelope.fill"
        }
    }
}


class EditPageHeaderView: UITableViewHeaderFooterView {

    static let reuseID = "EditPageHeaderView"
      var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [TopImageButtonLabelView(actions: .messages),
                                                       TopImageButtonLabelView(actions: .call),
                                                       TopImageButtonLabelView(actions: .video),
                                                       TopImageButtonLabelView(actions: .mail) ])
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
    // 60+10 + 5 +5
    
    private func configureContraints() {
        addSubview(hStackView)
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            hStackView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
}

