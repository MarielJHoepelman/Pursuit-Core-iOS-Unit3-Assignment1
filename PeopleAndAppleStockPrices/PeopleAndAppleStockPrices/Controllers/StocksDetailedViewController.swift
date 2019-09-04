//
//  StocksDetailedViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Mariel Hoepelman on 9/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailedViewController: UIViewController {
    
    var stock: StocksFromJSON!
    
    @IBOutlet weak var topTextField: UITextView!
    @IBOutlet weak var bottonTextField: UITextView!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(stock)
        
    }

}
