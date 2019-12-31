//
//  UIViewExtension.swift
//  StocksApp
//
//  Created by ian schoenrock on 12/31/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit

extension UIView {
    func pin(to superView: UIView){
        translatesAutoresizingMaskIntoConstraints                              = false
        topAnchor.constraint(equalTo: superview!.topAnchor).isActive           = true
        bottomAnchor.constraint(equalTo: superview!.bottomAnchor).isActive     = true
        leadingAnchor.constraint(equalTo: superview!.leadingAnchor).isActive   = true
        trailingAnchor.constraint(equalTo: superview!.trailingAnchor).isActive = true
    }
}

