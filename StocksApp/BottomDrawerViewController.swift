//
//  NewsBottomDrawer.swift
//  Stocks
//
//  Created by ian schoenrock on 12/13/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit

class BottomDrawerViewController: UIViewController, UITableViewDelegate {
    
    var tableView = UITableView()
    let fullView: CGFloat = 100
    var stocks = ["Dow Jones", "S$P 500", "AAPL", "BA"]
    var partialView: CGFloat {
        return UIScreen.main.bounds.height - 150
    }
    
    var isScrollEnabled: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
       
        
        view.backgroundColor =  UIColor.darkGray
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(BottomDrawerViewController.panGesture))
        view.addGestureRecognizer(gesture)
        roundCorners(cornerRadius: 20)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.2) { [weak self] in
            let frame = self?.view.frame
            let yComponent = UIScreen.main.bounds.height - 200
            self?.view.frame = CGRect(x: 0, y: yComponent, width: frame!.width, height: frame!.height)
        }
    }
    
    @objc func panGesture(recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        let y = self.view.frame.minY
        
        self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        if(recognizer.state == .ended){
            print(view.frame.height)
            if(recognizer.direction == Direction.Down){
                
                                
                UIView.animate(withDuration: 0.1){[weak self ] in
                    self!.view.frame = CGRect(x: 0, y: self!.view.frame.height * 0.80, width: self!.view.frame.width, height: self!.view.frame.height)
                }
                
                tableView.isScrollEnabled = false;
            } else if(recognizer.direction == Direction.Up){
                 UIView.animate(withDuration: 0.1){[weak self ] in
                                   self!.view.frame = CGRect(x: 0, y: self!.view.frame.height * 0.10, width: self!.view.frame.width, height: self!.view.frame.height)
                               }
                
                tableView.isScrollEnabled = true;
            }
        }
    }
    
    func roundCorners(cornerRadius: Double) {
        self.view.layer.cornerRadius = CGFloat(cornerRadius)
        self.view.clipsToBounds = true
    }
    
    func setupTableView() {
      view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.isScrollEnabled = false;
        tableView.delegate = self
        tableView.dataSource = self
      tableView.translatesAutoresizingMaskIntoConstraints = false
      tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
}

public enum Direction: Int {
    case Up
    case Down
    case Left
    case Right

    public var isX: Bool { return self == .Left || self == .Right }
    public var isY: Bool { return !isX }
}

public extension UIPanGestureRecognizer {

    var direction: Direction? {
        let velo = velocity(in: view)
        let vertical = abs(velo.y) > abs(velo.x)
        switch (vertical, velo.x, velo.y) {
        case (true, _, let y) where y < 0: return .Up
        case (true, _, let y) where y > 0: return .Down
        case (false, let x, _) where x > 0: return .Right
        case (false, let x, _) where x < 0: return .Left
        default: return nil
        }
    }
}


extension BottomDrawerViewController: UIGestureRecognizerDelegate {

    // Solution
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let gesture = (gestureRecognizer as! UIPanGestureRecognizer)
        let direction = gesture.velocity(in: view).y

        let y = view.frame.minY
        if (y == fullView && tableView.contentOffset.y == 0 && direction > 0) || (y == partialView) {
            tableView.isScrollEnabled = false
        } else {
            tableView.isScrollEnabled = true
        }
        
        return false
    }
    
}

extension BottomDrawerViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return stocks.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = stocks[indexPath.row]
    return cell
  }
}
