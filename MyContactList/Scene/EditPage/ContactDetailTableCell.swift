//
//  ContactDetailTableCell.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 26.04.24.
//

import UIKit

class ContactDetailTableCell: UITableViewCell {
    static let reuseID = "ContactDetailTableCell"
    
    private lazy var photoPoster: PhotoPoster = {
        let poster = PhotoPoster(name: "", surname: "", personImage: "", frame: .zero)
        poster.translatesAutoresizingMaskIntoConstraints = false
        return poster
    }()
    
    private lazy var numberview: DetailMobileUIView = {
        let number = DetailMobileUIView(number: "", frame: .zero)
        number.translatesAutoresizingMaskIntoConstraints = false
        return number
    }()
    
    private lazy var notesView: DetailNotesUIView = {
        let notes = DetailNotesUIView(notesText: "", frame: .zero)
        notes.translatesAutoresizingMaskIntoConstraints = false
        return notes
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(photoPoster)
        contentView.addSubview(numberview)
        contentView.addSubview(notesView)
    }
    
    private func setupConstraints() {
        backgroundColor = .systemGray5
        NSLayoutConstraint.activate([
            photoPoster.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            photoPoster.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            photoPoster.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            photoPoster.heightAnchor.constraint(equalToConstant: 80),
            
            numberview.topAnchor.constraint(equalTo: photoPoster.bottomAnchor, constant: 10),
            numberview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            numberview.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            numberview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            numberview.heightAnchor.constraint(equalToConstant: 90),
            
            //deysih numberi
            notesView.topAnchor.constraint(equalTo: numberview.bottomAnchor, constant: 10),
            notesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            notesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            notesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            notesView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    func configure(with contact: ContactData) {
        // Update the photoPoster with new data
        photoPoster.name = contact.name ?? ""
        photoPoster.surname = contact.surname ?? ""
        photoPoster.personImage = contact.photo ?? ""
        numberview.number = contact.number ?? ""
        notesView.notesText = ""
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
