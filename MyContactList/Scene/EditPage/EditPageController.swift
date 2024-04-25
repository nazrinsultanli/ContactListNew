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
    
    func makeLargeNavbar(height: CGFloat, scrolled: Bool) {
        let height = height
                
        let navbar = UINavigationBar()
        navbar.frame.size.width = UIScreen.main.bounds.size.width
        navbar.frame.size.height = CGFloat(height)
        navbar.frame = CGRect(x: 0,
                              y: 0,
                              width: navbar.frame.size.width,
                              height: navbar.frame.size.height)
           
        navbar.barTintColor = .purple
        navbar.tintColor = .brown
            
        if scrolled == true {
            navbar.addSubview(TopImageButtonLabelSmallView(name: "naz", surname: "xan", personImage: "as", frame: CGRect(x: 0,y: 0,width: navbar.frame.size.width,      height: navbar.frame.size.height)))
       
            view.addSubview(navbar)
        } else{
            navbar.addSubview(UIView())
            view.addSubview(navbar)
        }
        
                
        self.view?.frame = CGRect(x: 0, y: Int(height), width: Int(UIScreen.main.bounds.width), height: (Int(UIScreen.main.bounds.height) - Int(height)))
        self.additionalSafeAreaInsets.top = CGFloat(height)
    }
    @objc func cancel(){
        
    }
    func setHeaderView(){
        headerView = TopImageButtonLabelLargeView(
            name: "Tarlan",
            surname: "Sultanli",
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
        return 65
    }
    //MARK: ------
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY > 40 {
//            self.navigationItem.titleView = setNavbarWhenScrolled()
//            myheaderView?.titleName.isHidden = false
//            let height = CGFloat(200)
//            navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
//            navigationController?.navigationBar.backgroundColor = .cyan
            makeLargeNavbar(height: 90, scrolled: true)
            self.navigationController?.isNavigationBarHidden = true

        }
        else {
            self.navigationItem.titleView?.isHidden = true
            myheaderView?.titleName.isHidden = true
            makeLargeNavbar(height: 0, scrolled: false)
            self.navigationController?.isNavigationBarHidden = false
            
        }
    }
    
    
    
    
}

