//
//  ViewController.swift
//  ContactList
//
//  Created by Nazrin Dolkhanova on 18.04.24.
//

import UIKit
import CoreData



class ContactListController: UIViewController {

    
    var viewModel = ContactListViewModel()
    
    let searchController = UISearchController(searchResultsController: SearchResultController())
    
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
        
        viewModel.fetchItemsfromDataBase {
            tableView.reloadData()
        }
        setControllerUI()
        setSearchBar()
        setConstraints()
    }
    
    func setControllerUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Contact"
        view.backgroundColor = .white
       
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image:  UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonTapped))
    }
    @objc func plusButtonTapped() {
        print("asasas")
    }
    
    func setSearchBar() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}

extension ContactListController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = viewModel.sectionTitles[section]
        return viewModel.array[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let key = viewModel.sectionTitles[indexPath.section]
        let contact = viewModel.array[key]![indexPath.row]
        cell.textLabel?.text = (contact.name ?? "") + " " + (contact.surname ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return viewModel.sectionTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let key = viewModel.sectionTitles[indexPath.section]
        guard let contact = viewModel.array[key]?[indexPath.row] else {
            return
        }
        
        let controller = EditPageController()
        navigationController?.show(controller, sender: nil)
        controller.contact = contact
        print(contact)
    }

}

extension ContactListController: UISearchResultsUpdating  {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{
            return
        }
        
        tableView.isHidden = !text.isEmpty
        
        (searchController.searchResultsController as! SearchResultController).getSearchText(text: text)

    }
}
