//
//  ViewController.swift
//  BottomDrawerPRactice
//
//  Created by ian schoenrock on 12/13/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var navBar = UIView()
    var tableView = UITableView()
    var titleLabel = UILabel()
    var subtitleLabel = UILabel()
    var editButton = UIButton()
    lazy var searchBar:UISearchBar = UISearchBar()
    
    var stocks = ["Dow Jones", "S&P 500", "AAPL", "BA"]
    var names = ["Dow Jones", "S&P 500", "AAPL", "BA"]
    let cellName = "StockCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFont()
        setupNavBar()
        setupSearchBar()
        setupTableView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBottomDrawerView()
    }
    
    func setupFont(){
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        subtitleLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        subtitleLabel.textColor = .systemGray
    }
    
    func setupNavBar(){
        view.addSubview(navBar)
        navBar.translatesAutoresizingMaskIntoConstraints                              = false
        navBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive           = true
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive   = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        navBar.addSubview(titleLabel)
        navBar.addSubview(subtitleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: navBar.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 20).isActive = true
        titleLabel.text = "Stocks"
        subtitleLabel.text = "December 31"
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: navBar.leadingAnchor, constant: 20).isActive = true
        
        
        navBar.addSubview(editButton)
        editButton.setTitle("Edit", for: .normal)
        editButton.setTitleColor(.systemBlue, for: .normal)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.topAnchor.constraint(equalTo: navBar.topAnchor).isActive = true
        editButton.trailingAnchor.constraint(equalTo: navBar.trailingAnchor, constant: -20).isActive = true
        
        editButton.bottomAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
    }
    
    func setupSearchBar(){
        view.addSubview(searchBar)
        searchBar.placeholder = "Search"
        
        searchBar.backgroundImage = UIImage()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.topAnchor.constraint(equalTo: navBar.bottomAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        searchBar.sizeToFit()
    }

    func addBottomDrawerView(){
        let bottomDrawer = BottomDrawerViewController()
        self.addChild(bottomDrawer)
        self.view.addSubview(bottomDrawer.view)
        bottomDrawer.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: self.view.frame.maxX, height: self.view.frame.maxY )
    }
    
    func setupTableView() {
      view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints                              = false
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive           = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive     = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive   = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.rowHeight = 80
      tableView.register(StockListCell.self, forCellReuseIdentifier: cellName)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stocks.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellName) as! StockListCell
    cell.set(symbol: stocks[indexPath.row], name: names[indexPath.row])
    return cell
  }
}

