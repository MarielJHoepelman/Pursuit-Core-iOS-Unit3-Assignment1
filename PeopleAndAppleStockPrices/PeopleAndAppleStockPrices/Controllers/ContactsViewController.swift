//
//  ContactsViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Mariel Hoepelman on 9/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    var contacts: Results!
    
    @IBOutlet weak var ContactsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ContactsTableView.dataSource = self
        ContactsTableView.delegate = self
//        print(contacts)
    }


}

extension ContactsViewController: UITableViewDelegate {
    
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContactsTableView.dequeueReusableCell(withIdentifier: "contactsCell")
        cell?.textLabel?.text = "test"
        cell?.detailTextLabel?.text = "test"
        return cell!
    }
    
    
}
