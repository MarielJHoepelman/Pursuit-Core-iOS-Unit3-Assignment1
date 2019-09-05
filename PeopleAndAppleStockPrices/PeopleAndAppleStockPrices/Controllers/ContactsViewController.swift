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

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        ContactsTableView.dataSource = self
        ContactsTableView.delegate = self
        searchBar.delegate = self
    }
    
    var searchString: String? = nil {
        didSet {
            ContactsTableView.reloadData()
        }
    }
    
    var contactsSearchResult: [Contacts] {
        get {
            guard let searchString = searchString else {
                return contacts.results
            }
            guard searchString != "" else {
                return contacts.results
            }
            
            let contactsResults = contacts.results.filter{$0.name.first.lowercased().contains(searchString.lowercased())}
//configure search by last name
            if contactsResults.count > 0 {
                return contactsResults
            }else{
                showNotFoundAlert()
            }
            return contacts.results
        }
    }
    
    func showNotFoundAlert() -> Void {
        let alert = UIAlertController(title: "\u{1F5E3} Contact not found!", message: "Please try again", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
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

        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactsDVC = segue.destination as? ContactsDetailedViewController else
        {fatalError("No contact found")}
        guard let selectedIndexPath = ContactsTableView.indexPathForSelectedRow else {fatalError()}
        
        //        contactsDVC.contact = contacts?.results[selectedIndexPath.row]
        contactsDVC.contact = contactsSearchResult[selectedIndexPath.row]
    }

}

extension ContactsViewController: UITableViewDelegate {
    
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsSearchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContactsTableView.dequeueReusableCell(withIdentifier: "contactsCell")
//        let result = contacts.results[indexPath.row]
        let result = contactsSearchResult[indexPath.row]
        cell?.textLabel?.text = "\(result.name.first.capitalized) \(result.name.last.capitalized)"
        cell?.detailTextLabel?.text = result.location.state.capitalized
        return cell!
    }
    
}

extension ContactsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchString = searchBar.text
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchString = searchBar.text
    }
}
