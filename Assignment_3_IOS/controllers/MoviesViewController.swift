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
    let thirdMovie: String = ""
    
    @IBOutlet weak var firstMovieLabel: UILabel!
    @IBOutlet weak var secondMovieLabel: UILabel!
    @IBOutlet weak var thirdMovieLabel: UILabel!
    
    @IBOutlet weak var firstMovieImg: UIImageView!
    @IBOutlet weak var secondMovieImg: UIImageView!
    @IBOutlet weak var thirdMovieImg: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstMovieImg.image = UIImage(named: "the_lost_city.jpeg")
        secondMovieImg.image = UIImage(named: "frozen.jpeg")
        thirdMovieImg.image = UIImage(named: "home_alone.jpeg")
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
    @IBAction func onBuyClick3(_ sender: Any) {
        UserDefaults.standard.set(thirdMovie, forKey: MOVIE_NAME)
        self.performSegue(withIdentifier: "buySegue", sender: nil)
    }
}
