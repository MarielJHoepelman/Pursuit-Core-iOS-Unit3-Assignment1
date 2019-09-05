//
//  ContactsModel.swift
//  PeopleAndAppleStockPrices
//
//  Created by Mariel Hoepelman on 9/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum ContactsJSONError: Error {
    case decodingError(Error)
}

struct ContactsFromJSON: Codable {
    let results: [Contacts]
    
    static func getContact(from data: Data) throws -> ContactsFromJSON? {
        do {
            let contact = try
                JSONDecoder().decode(ContactsFromJSON.self, from: data)
            return contact
        } catch let decodeError {
            print("could not decode info \(decodeError)")
            return nil
        }
    }
    
}

struct Contacts: Codable {
    let name: Name
    let location: Location
    let email: String
    let picture: Picture
}

struct Name: Codable {
    let first: String
    let last: String
}

struct Location: Codable {
    let state: String
}

struct Picture: Codable {
    let large: String
}
