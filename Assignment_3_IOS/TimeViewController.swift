//
//  TimeViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 15/5/2022.
//

import UIKit

class TimeViewController: UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func on12Click(_ sender: Any)
    {
        self.performSegue(withIdentifier: "seatsSegue", sender: nil)
    }
    @IBAction func on15Click(_ sender: Any)
    {
        self.performSegue(withIdentifier: "seatsSegue", sender: nil)
    }
}
