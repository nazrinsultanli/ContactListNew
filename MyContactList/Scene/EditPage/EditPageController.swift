//
//  EditPageController.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 22.04.24.
//

import UIKit




class EditPageController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .brown
//        tableView.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.reuseID)
        tableView.register(EditPageHeaderView.self, forHeaderFooterViewReuseIdentifier: EditPageHeaderView.reuseID)

//        tableView.tableHeaderView?.translatesAutoresizingMaskIntoConstraints = false
//        tableView.tableHeaderView = EditPageHeaderView(
//            frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 180))
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    

    func setConstraints() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


extension EditPageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section
//        return viewModel.items.count
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCell.reuseID, for: indexPath) as! HomeTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Return the height of the row
        return 200
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    // MARK:  --- HEADER View

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: EditPageHeaderView.reuseID) as! EditPageHeaderView
        headerView.backgroundColor = .systemPurple
        return headerView
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.red.withAlphaComponent(0.4)
        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        // Return the height of the header view
        return 180
    }
    //MARK: ------

}




