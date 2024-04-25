//
//  EditPageController.swift
//  MyContactList
//
//  Created by Nazrin Dolkhanova on 22.04.24.
//




import UIKit


class EditPageController: UIViewController {
    
    private let headerForLargeViewHeight: CGFloat = 150
    private var headerForLargeView: UIView!
    private var headerForSmallView = TopImageButtonLabelSmallView(name: "atam", surname: "anam", personImage: "anamatam", frame: .zero)
        
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemGray
        tableView.register(EditPageHeaderView.self, forHeaderFooterViewReuseIdentifier: EditPageHeaderView.reuseID)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        
        
        
    }
   
    // Setup views and constraints
    private func setupViews() {
        view.backgroundColor = .systemGray
        navigationController?.navigationBar.prefersLargeTitles = false
//        navigationController?.navigationBar.backgroundColor = .clear
        view.addSubview(tableView)
        view.addSubview(headerForSmallView)
        setLargeHeaderView()
        setConstraints()
        
    }
    
    // Setup the large header view for the table
    private func setLargeHeaderView() {
        headerForLargeView = TopImageButtonLabelLargeView(
            name: "Tarlan",
            surname: "Sultanli",
            personImage: "naznaznaz",
            frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: headerForLargeViewHeight)
        )
        tableView.tableHeaderView = headerForLargeView
    }
    
    // Configure constraints for tableView and small header view
    private func setConstraints() {
        headerForSmallView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerForSmallView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
            headerForSmallView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerForSmallView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerForSmallView.heightAnchor.constraint(equalToConstant: 110),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}

extension EditPageController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "name surname"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: EditPageHeaderView.reuseID) as? EditPageHeaderView
        sectionHeader?.backgroundColor = .systemGray
        return sectionHeader
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          let inset: CGFloat = 70
        print(scrollView.contentOffset.y)
        //0-60
          if scrollView.contentOffset.y < 100 && scrollView.contentOffset.y > 0 {
              scrollView.contentInset = UIEdgeInsets(top: inset, left: 0, bottom: 0, right: 0)
              headerForSmallView.isHidden = true
              headerForLargeView.isHidden = false //38 -> 60
              let overlay = UIVisualEffectView()
              // Put it somewhere, give it a frame...
              UIView.animate(withDuration: 0.5) {
                  overlay.effect = UIBlurEffect(style: .light)
              }
//              navigationController?.navigationBar.backgroundColor = .systemGray
              navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
              navigationController?.navigationBar.shadowImage = UIImage()
          } else {
              //menfi
              if scrollView.contentOffset.y <= 0 {
                  scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                  headerForSmallView.isHidden = true
                  headerForLargeView.isHidden = false
                  
              } else { //60dan yuxari
                  scrollView.contentInset = UIEdgeInsets(top: inset, left: 0, bottom: 0, right: 0)
                  headerForSmallView.isHidden = false
                  navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                  navigationController?.navigationBar.shadowImage = UIImage()
                  headerForLargeView.isHidden = true
              }
          }
    }
}
