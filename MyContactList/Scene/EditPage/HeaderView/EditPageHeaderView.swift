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
    private var isShowTitleDidSet: Bool = false {
        didSet {
            titleName.isHidden = isShowTitleDidSet
        }
    }
    
   
    static let reuseID = "EditPageHeaderView"
    
     lazy var titleName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .white
        label.textColor = .white
        return label
    }()
    
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
    
    private func configureContraints() {
//        addSubview(titleName)
        addSubview(hStackView)
        NSLayoutConstraint.activate([

            hStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            hStackView.heightAnchor.constraint(equalToConstant: 60),

        ])
    }
    
}

