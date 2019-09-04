//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Mariel Hoepelman on 9/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {

    @IBOutlet weak var stocksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksTableView.delegate = self
        stocksTableView.dataSource = self 

    }
    
}

extension StocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stocksTableView.dequeueReusableCell(withIdentifier: "stocksCell")
//        let result = contacts.results[indexPath.row]
        cell?.textLabel?.text = "test"
        cell?.detailTextLabel?.text = "test"
       return cell!
    }
    
}

extension StocksViewController: UITableViewDelegate {
    
}
