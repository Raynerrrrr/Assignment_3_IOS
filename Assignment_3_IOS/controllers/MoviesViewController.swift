//
//  MoviesViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 15/5/2022.
//

import UIKit

class MoviesViewController: UIViewController
{
    
    let firstMovie: String = ""
    let secondMovie: String = ""
    
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
        
        UserDefaults.standard.set(firstMovie, forKey: MOVIE_NAME)
        self.performSegue(withIdentifier: "buySegue", sender: nil)
    }
    @IBAction func onBuyClick2(_ sender: Any)
    {
        UserDefaults.standard.set(secondMovie, forKey: MOVIE_NAME)
        self.performSegue(withIdentifier: "buySegue", sender: nil)
    }
}
