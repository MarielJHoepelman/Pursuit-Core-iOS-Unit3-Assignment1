//
//  ContactsDetailedViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Mariel Hoepelman on 9/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsDetailedViewController: UIViewController {
    
    var contact: Contacts!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "\(contact.name.first.capitalized) \(contact.name.last.capitalized)"
        emailLabel.text = contact.email 
        stateLabel.text = contact.location.state.capitalized
    }

}
