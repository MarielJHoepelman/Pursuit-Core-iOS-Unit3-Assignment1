//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Mariel Hoepelman on 9/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {
    
    var stocks = [StocksFromJSON]()
    
    @IBOutlet weak var stocksTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stocksTableView.delegate = self
        stocksTableView.dataSource = self
        loadData()
        print(stocks)
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "applestocks", ofType: "json") else {
            fatalError("Coudn't find json file")
        }
        print(pathToJSONFile)
        
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            
            let data = try
                Data(contentsOf: url)
            
            let stocksFromJSON = try StocksFromJSON.getStocks(from: data)
            stocks = stocksFromJSON!
            
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let stocksDVC = segue.destination as? StocksDetailedViewController else {
            fatalError("Destination not found")
        }
        guard let selectedIndexPath = stocksTableView.indexPathForSelectedRow else {
            fatalError()
        }
        
        stocksDVC.stock = stocks[selectedIndexPath.row]
    }
    
}

extension StocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stocksTableView.dequeueReusableCell(withIdentifier: "stocksCell")

        cell?.textLabel?.text = stocks[indexPath.row].date
        cell?.detailTextLabel?.text = String(stocks[indexPath.row].open)
       return cell!
    }
    
}

extension StocksViewController: UITableViewDelegate {
    
}
