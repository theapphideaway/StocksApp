//
//  StockListCell.swift
//  StocksApp
//
//  Created by ian schoenrock on 12/31/19.
//  Copyright © 2019 ian schoenrock. All rights reserved.
//

import UIKit

class StockListCell: UITableViewCell{
    
    let symbol = UILabel()
    
    let name = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(symbol)
        addSubview(name)
        setLabelStyle()
        setLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(symbol: String, name: String){
        self.symbol.text = symbol
        self.name.text = name
    }
    
    func setLabelStyle(){
        symbol.font = UIFont.boldSystemFont(ofSize: 18.0)
        name.font = UIFont.boldSystemFont(ofSize: 16.0)
        
    }
    
    func setLabelConstraints(){
        symbol.translatesAutoresizingMaskIntoConstraints = false
        symbol.topAnchor.constraint(equalTo: topAnchor).isActive = true
        symbol.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: symbol.bottomAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        name.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
    }
    
}
