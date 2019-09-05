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
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bottonView: UIView!
    @IBOutlet weak var closePriceLabel: UILabel!
    @IBOutlet weak var openPriceLabel: UILabel!
    
    private func updateViewColor(open: Double, close: Double) -> Void {
        
        let green = UIColor(displayP3Red: 0.10185185, green: 0.99338627, blue: 0.3068783, alpha: 1)
        
        let red = UIColor(displayP3Red: 1.0, green: 0.023809524, blue: 0.088624336, alpha: 1)
        
        if close > open {
            topView.backgroundColor = green
            bottonView.backgroundColor = green
        } else {
            topView.backgroundColor = red
            bottonView.backgroundColor = red
        }
        
        
    }
    
    private func switchImage(open: Double, close: Double) -> Void {
        let  thumbsUp = UIImage.init(named: "thumbsUp")
        let thumbsDown = UIImage.init(named: "thumbsDown")
        
        if close > open {
            imageView.image = thumbsUp
        } else {
            imageView.image = thumbsDown
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.text = stock.date
        openPriceLabel.text = String("Open: \(stock.open)")
        closePriceLabel.text = String("Close: \(stock.close)")
        updateViewColor(open: stock.open, close: stock.close)
        switchImage(open: stock.open, close: stock.close)
    }

}
