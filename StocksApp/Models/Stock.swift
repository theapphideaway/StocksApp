//
//  Stock.swift
//  StocksApp
//
//  Created by ian schoenrock on 1/1/20.
//  Copyright © 2020 ian schoenrock. All rights reserved.
//

import Foundation

// MARK: - Stock
struct Stock: Codable {
    let metaData: MetaData
    let timeSeriesDaily: [String: TimeSeriesDaily]

    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeriesDaily = "Time Series (Daily)"
    }
}

// MARK: - MetaData
struct MetaData: Codable {
    let the1Information, the2Symbol, the3LastRefreshed, the4OutputSize: String
    let the5TimeZone: String

    enum CodingKeys: String, CodingKey {
        case the1Information = "1. Information"
        case the2Symbol = "2. Symbol"
        case the3LastRefreshed = "3. Last Refreshed"
        case the4OutputSize = "4. Output Size"
        case the5TimeZone = "5. Time Zone"
    }
}

// MARK: - TimeSeriesDaily
struct TimeSeriesDaily: Codable {
    let the1Open, the2High, the3Low, the4Close: String
    let the5Volume: String

    enum CodingKeys: String, CodingKey {
        case the1Open = "1. open"
        case the2High = "2. high"
        case the3Low = "3. low"
        case the4Close = "4. close"
        case the5Volume = "5. volume"
    }
}

