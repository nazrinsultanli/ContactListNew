//
//  SearchResultController.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 19.04.24.
//

import UIKit

class SearchResultController: UIViewController {
    var viewModel: SearchResultViewModel?
    
    lazy var topNameMatches: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "TOP NAME MATCHES"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
       
    }
    
    func setConstraints() {
        view.addSubview(topNameMatches)
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            topNameMatches.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topNameMatches.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            topNameMatches.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: topNameMatches.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension SearchResultController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.searchContacts().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = viewModel?.searchContacts()[indexPath.row].name
        return cell
    }
    
    
    
}
