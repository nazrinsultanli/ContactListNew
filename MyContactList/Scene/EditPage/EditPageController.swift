//
//  EditPageController.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 22.04.24.
//

import UIKit



class EditPageController: UIViewController {

    private var isShowTitle: Bool = false
    private let headerHeight: CGFloat = 200
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
        setConstraints()
        setHeaderView()

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
        myheaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: EditPageHeaderView.reuseID) as? EditPageHeaderView
        myheaderView?.titleName.text = "nazik"
        return myheaderView
    }

    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 110
    }
    //MARK: ------
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            if offsetY > 125 {
                self.navigationItem.titleView = setNavbar()
                myheaderView?.titleName.isHidden = true

                }
                else {
                    self.navigationItem.titleView?.isHidden = true
                    myheaderView?.titleName.isHidden = false

            }
        }
}

