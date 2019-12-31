//
//  ViewController.swift
//  BottomDrawerPRactice
//
//  Created by ian schoenrock on 12/13/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{

    var tableView = UITableView()
   
    
    var stocks = ["Dow Jones", "S$P 500", "AAPL", "BA"]
    
    override func viewDidLoad() {
    super.viewDidLoad()
      setupTableView()
      view.backgroundColor =  .darkGray
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
      tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stocks.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = stocks[indexPath.row]
    return cell
  }
}

