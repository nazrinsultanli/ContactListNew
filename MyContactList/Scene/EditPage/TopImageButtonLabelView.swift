//
//  TopImageButtonLabelView.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 23.04.24.
//
import UIKit

class TopImageButtonLabelView: UIView {
    private let title: String
    private let imageName: String
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.text = title
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = .white
        label.textColor = .white
        
        return label
    }()
    
    private var imageView: UIImageView!
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(systemName: imageName)
        imageView.backgroundColor = .clear
        imageView.tintColor = .white
        
        addSubview(backgroundView)
        addSubview(titleName)
        addSubview(imageView)
        
        
        // stack 60
        NSLayoutConstraint.activate([
            
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            

            imageView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 6),
            imageView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 28),
            imageView.heightAnchor.constraint(equalToConstant: 25),

            titleName.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            titleName.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            titleName.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -6)
        ])

    }
}
