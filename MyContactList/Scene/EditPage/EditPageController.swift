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
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        
    }

    func setConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}


extension EditPageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
        return 180
    }
    //MARK: ------

//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y < -150 {
//            
//        }
//        print(scrollView.contentOffset.y)
//    }
}






extension EditPageController: CustomNavigationBarDelegate {
    func backButtonTapped() {
        // Handle back button tap
        navigationController?.popViewController(animated: true)
    }
}
