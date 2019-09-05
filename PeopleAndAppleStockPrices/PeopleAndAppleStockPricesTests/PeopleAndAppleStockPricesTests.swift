//
//  PeopleAndAppleStockPricesTests.swift
//  PeopleAndAppleStockPricesTests
//
//  Created by Mariel Hoepelman on 9/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest

class PeopleAndAppleStockPricesTests: XCTestCase {
    
    private func getContactsDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "contacts", ofType: "json") else {fatalError("couldn't get data fron JSON file called contacts.json")}
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("couldn't get data fron JSON file: \(jsonError)")
        }
    }

//    func testGetContactsDataFromJSON() {
//        let data = getContactsDataFromJSON()
//        let contacts = ContactsFromJSON.getContact(from: data)
//        XCTAssert(contacts != nil, "Found nil")
//    }
    
    private func getStocksDataFromJSON() -> Data {
        guard let pathToData = Bundle.main.path(forResource: "applestocks", ofType: "json") else {fatalError("couldn't get data fron JSON file called contacts.json")}
        let url = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch let jsonError {
            fatalError("couldn't get data fron JSON file: \(jsonError)")
        }
    }
    
//        func testGetStocksDataFromJSON() {
//            let data = getStocksDataFromJSON()
//            let stocks = StocksFromJSON.getStocks(from: data)
//            XCTAssert(stocks != nil, "Found nil")
//        }
}
