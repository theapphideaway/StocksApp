//
//  ViewController.swift
//  BottomDrawerPRactice
//
//  Created by ian schoenrock on 12/13/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var tableView = UITableView()
   
    lazy var searchBar:UISearchBar = UISearchBar()
    
    var stocks = ["Dow Jones", "S&P 500", "AAPL", "BA"]
    var names = ["Dow Jones", "S&P 500", "AAPL", "BA"]
    
    let cellName = "StockCell"
    
    override func viewDidLoad() {
    super.viewDidLoad()
      setupTableView()
      view.backgroundColor =  .darkGray
        navigationItem.searchController = UISearchController()
        navigationItem.title = "Stocks"
        
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBottomDrawerView()
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
        tableView.pin(to: view)
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

