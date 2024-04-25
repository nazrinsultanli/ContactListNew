//
//  EditPageController.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 22.04.24.
//

import UIKit



class EditPageController: UIViewController {
    
    private let headerHeight: CGFloat = 150
    private var headerView: UIView!
    
    private var myheaderView: EditPageHeaderView?
    
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
        
        view.backgroundColor = .green
        setConstraints()
        setHeaderView()
        navigationController?.navigationBar.prefersLargeTitles = false

        
    }
    func setHeaderView(){
        headerView = TopImageButtonLabelLargeView(
            name: "nazrin",
            surname: "dolkhanoiva",
            personImage: "naznaznaz",
            frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: headerHeight)
        )
        tableView.tableHeaderView = headerView
        
    }
    
    
    func setConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func setNavbarWhenScrolled() -> UIView {
        let titleContainer = UIStackView()
        titleContainer.axis = .vertical
        titleContainer.spacing = 10
        
        titleContainer.backgroundColor = .yellow
        titleContainer.layer.cornerRadius = 20
//        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.blue
        titleLabel.text = "ST"
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        
        titleContainer.addArrangedSubview(titleLabel)
        titleContainer.addArrangedSubview(label)
        
        
        
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
        myheaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: EditPageHeaderView.reuseID) as? EditPageHeaderView
        myheaderView?.titleName.text = "nazik"
        myheaderView?.titleName.isHidden = true
        return myheaderView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    //MARK: ------
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY > 20 {
            self.navigationItem.titleView = setNavbarWhenScrolled()
            myheaderView?.titleName.isHidden = false
            
        }
        else {
            self.navigationItem.titleView?.isHidden = true
            myheaderView?.titleName.isHidden = true
            
            
        }
    }
}

