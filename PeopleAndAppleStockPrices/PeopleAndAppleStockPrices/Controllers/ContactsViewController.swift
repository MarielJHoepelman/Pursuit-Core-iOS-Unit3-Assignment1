//
//  ContactsViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Mariel Hoepelman on 9/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    var contacts: ContactsFromJSON!
    
    @IBOutlet weak var ContactsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ContactsTableView.dataSource = self
        ContactsTableView.delegate = self
        loadData()
        print(contacts)
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "contacts", ofType: "json") else {
            fatalError("Coudn't find json file")
        }
        print(pathToJSONFile)
        
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            
            let data = try
                Data(contentsOf: url)
            
            let contactsFromJSON = try ContactsFromJSON.getContact(from: data)
            contacts = contactsFromJSON
            print(contacts)
        } catch {
            print(error)
        }
    }


}

extension ContactsViewController: UITableViewDelegate {
    
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContactsTableView.dequeueReusableCell(withIdentifier: "contactsCell")
        let result = contacts.results[indexPath.row]
        cell?.textLabel?.text = "\(result.name.first.capitalized) \(result.name.last.capitalized)"
        cell?.detailTextLabel?.text = result.location.state.capitalized
        return cell!
    }
    
}
