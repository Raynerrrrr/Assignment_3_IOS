//
//  SeatsViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 15/5/2022.
//

import UIKit

class SeatsViewController: UIViewController
{
    
    var seatSelection: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onConfirmClick(_ sender: Any)
    {
        
        UserDefaults.standard.set(seatSelection, forKey: MOVIE_SEAT)
        self.performSegue(withIdentifier: "confirmSegue", sender: nil)
    }
}
