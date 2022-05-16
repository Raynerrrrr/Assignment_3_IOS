//
//  TimeViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 15/5/2022.
//

import UIKit

class TimeViewController: UIViewController
{
    
    var timeSelection: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func on12Click(_ sender: Any)
    {
        timeSelection = "12:00"
        UserDefaults.standard.set(timeSelection, forKey: MOVIE_TIME)
        self.performSegue(withIdentifier: "seatsSegue", sender: nil)
    }
    @IBAction func on15Click(_ sender: Any)
    {
        timeSelection = "15:00"
        UserDefaults.standard.set(timeSelection, forKey: MOVIE_TIME)
        self.performSegue(withIdentifier: "seatsSegue", sender: nil)
    }
}
