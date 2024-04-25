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
    private var isShowTitleDidSet: Bool = true {
        didSet {
            titleName.isHidden = isShowTitleDidSet
        }
    }
    
   
    static let reuseID = "EditPageHeaderView"
    
     lazy var titleName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .white
         
        label.textColor = .cyan
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
    // 60+10 + 5 +5
    
    private func configureContraints() {
//        addSubview(titleName)
        addSubview(hStackView)
        titleName.backgroundColor = .yellow
        NSLayoutConstraint.activate([
            
//            titleName.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            titleName.centerXAnchor.constraint(equalTo: centerXAnchor),

            hStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            hStackView.heightAnchor.constraint(equalToConstant: 60),

        ])
    }
    
}

