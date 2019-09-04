//
//  StocksModel.swift
//  PeopleAndAppleStockPrices
//
//  Created by Mariel Hoepelman on 9/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum StocksJSONError: Error {
    case decodingError(Error)
}
struct StocksFromJSON: Codable {
    let date: String
    let close: Double
    let open: Double
    
    static func getContact(from data: Data) throws -> [StocksFromJSON] {
        do {
            let stock = try
                JSONDecoder().decode([StocksFromJSON].self, from: data)
            return stock
        } catch {
            throw StocksJSONError.decodingError(error)
        }
    }
}
