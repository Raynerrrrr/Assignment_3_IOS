//
//  MoviesViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 15/5/2022.
//

import UIKit

class MoviesViewController: UIViewController
{
    @IBOutlet weak var firstMovieLabel: UILabel!
    @IBOutlet weak var secondMovieLabel: UILabel!
    
    @IBOutlet weak var firstMovieImg: UIImageView!
    @IBOutlet weak var secondMovieImg: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBuyClick(_ sender: Any)
    {
        self.performSegue(withIdentifier: "buySegue", sender: nil)
    }
    @IBAction func onBuyClick2(_ sender: Any)
    {
        self.performSegue(withIdentifier: "buySegue", sender: nil)
    }
}
