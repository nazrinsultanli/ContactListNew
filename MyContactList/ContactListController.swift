//
//  ViewController.swift
//  ContactList
//
//  Created by Nazrin Dolkhanova on 18.04.24.
//

import UIKit
import CoreData

class ResultsVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
    }
}


class ContactListController: UIViewController {
    let context = AppDelegate().persistentContainer.viewContext
    var array = [String: [ContactData]]() // Dictionary to store contacts by section
    var sectionTitles = [String]() // Array to store section titles
    
    
//    var viewModel = ContactListViewModel()
    let searchController = UISearchController(searchResultsController:ResultsVC())
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
        
        fetchItemsfromDataBase()
        setControllerUI()
        setSearchBar()
        setConstraints()
    }
    
    func setControllerUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Contact"
        view.backgroundColor = .white
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
    

    func fetchItemsfromDataBase() {
        do {
            let contacts = try context.fetch(ContactData.fetchRequest()) as! [ContactData]
            array.removeAll() // Clear existing data
            sectionTitles.removeAll()
            for contact in contacts {
                let firstLetter = String(contact.name!.prefix(1)).uppercased()
                if array[firstLetter] == nil {
                    array[firstLetter] = [contact]
                    sectionTitles.append(firstLetter)
                } else {
                    array[firstLetter]?.append(contact)
                }
            }
            // Sort the array by section titles
            for (key, value) in array {
                array[key] = value.sorted(by: { $0.name! < $1.name! })
            }
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ContactListController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = sectionTitles[section]
        return array[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let key = sectionTitles[indexPath.section]
        let contact = array[key]![indexPath.row]
        cell.textLabel?.text = contact.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionTitles
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}

extension ContactListController: UISearchResultsUpdating  {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{
            return
        }
        let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = .yellow
        print(text)
    }
}
