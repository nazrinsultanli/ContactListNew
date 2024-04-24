//
//  EditPageController.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 22.04.24.
//

import UIKit



class EditPageController: UIViewController {

    private let headerHeight: CGFloat = 200
    private var headerView: UIView!
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .red
        
//        tableView.register(HomeTableCell.self, forCellReuseIdentifier: HomeTableCell.reuseID)
        tableView.register(EditPageHeaderView.self, forHeaderFooterViewReuseIdentifier: EditPageHeaderView.reuseID)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        setHeaderView()
//        adjustTableViewInsets(size: -80)
//        navigationController?.navigationBar.isHidden = true

    }

    
//    func adjustTableViewInsets(size: CGFloat) {
//        let topInset = navigationController?.navigationBar.frame.height ?? 0
//        tableView.contentInset = UIEdgeInsets(top: size, left: 0, bottom: 0, right: 0)
//        tableView.scrollIndicatorInsets = tableView.contentInset
//    }

    func setHeaderView(){
        headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: headerHeight))
        headerView.backgroundColor = .yellow
        headerView.translatesAutoresizingMaskIntoConstraints = false
        let titleLabel = UILabel(frame: headerView.bounds)
        titleLabel.text = "Contacts"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        headerView.addSubview(titleLabel)
        tableView.tableHeaderView = headerView
        
    }
    
    
    func setConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setNavbar() -> UIView {
        let titleContainer = UIView()
        titleContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 45)
        titleContainer.backgroundColor = .purple
        let searchIcon = UIButton()
        //searchIcon.setImage(UIImage(named: "search_icon"), for: UIControlState.normal)
        searchIcon.backgroundColor = UIColor.red
        searchIcon.layer.frame = CGRect(x: 0, y: 8, width: 28, height: 100)
        titleContainer.addSubview(searchIcon)
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 28, y: 8, width: UIScreen.main.bounds.size.width-28, height: 100)
        titleLabel.textColor = UIColor.blue//(red:255, green:255, blue:255, alpha:1.0)
        titleContainer.addSubview(titleLabel)
        titleLabel.text = "Sample Text"
        return titleContainer
        
    }
    
}


extension EditPageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "name surname"
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
//
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        (view as! UITableViewHeaderFooterView).contentView.backgroundColor = UIColor.red.withAlphaComponent(0.4)
//        (view as! UITableViewHeaderFooterView).textLabel?.textColor = UIColor.white
//    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    //MARK: ------
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
        print(offsetY)
            if offsetY > 125 {
                self.navigationItem.titleView = setNavbar()
//                let newHeaderHeight = max(headerHeight - offsetY, 60)
//                headerView.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: newHeaderHeight)
//                let titleLabel = headerView.subviews.compactMap { $0 as? UILabel }.first
//                titleLabel?.font = UIFont.systemFont(ofSize: 24 * (newHeaderHeight / headerHeight))
//                navigationController?.navigationBar.isHidden = false
            }
                else {
                    self.navigationItem.titleView?.isHidden = true
//                navigationController?.navigationBar.isHidden = true
            }
        }
}






extension EditPageController: CustomNavigationBarDelegate {
    func backButtonTapped() {
        // Handle back button tap
        navigationController?.popViewController(animated: true)
    }
}
