//
//  ViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 13/5/2022.
//

import UIKit

class HomeViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onMoviesClick(_ sender: Any)
    {
        self.performSegue(withIdentifier: "moviesSegue", sender: nil)
    }
    @IBAction func onTicketsClick(_ sender: Any)
    {
        self.performSegue(withIdentifier: "ticketsSegue", sender: nil)
    }
}

