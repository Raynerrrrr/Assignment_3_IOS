//
//  SeatsViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 15/5/2022.
//

import UIKit

class SeatsViewController: UIViewController
{
    var seats = Seats()
    var seatSelection: String = ""
    var screenWidth: UInt32 = UInt32(UIScreen.main.bounds.width)
    var screenHeight: UInt32 = UInt32(UIScreen.main.bounds.height)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        displaySeats()
    }
    
//    @objc func displaySeats() {
//        let numberOfSeats = 20
//        var i = 0
//
//        var x = 100
//        var y = screenHeight / 2
//
//
//        while i < numberOfSeats {
//            seats = Seats()
//            seats.frame = CGRect(x: x, y: Int(y), width: 100, height: 100)
//            x += 15
//            if i == 5 || i == 10 || i == 15 || i == 20 {
//                y += 20
//            }
//            i += 1
//        }
//
//    }
    
    @IBAction func onConfirmClick(_ sender: Any)
    {
        
        UserDefaults.standard.set(seatSelection, forKey: MOVIE_SEAT)
        self.performSegue(withIdentifier: "confirmSegue", sender: nil)
    }
}
