//
//  MoviesViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 15/5/2022.
//

import UIKit

class MoviesViewController: UIViewController
{
    var moviesData: [MoviesData] = []
    var firstMovie: String = ""
    var secondMovie: String = ""
    var thirdMovie: String = ""
    
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
        // Read the movie data from storage
        moviesData = readMovieData()
        
        // Set the movie variables correctly
        firstMovie = moviesData[0].name
        secondMovie = moviesData[1].name
        thirdMovie = moviesData[2].name
        
        // Set the movie names to their appropriate labels
        firstMovieLabel.text = moviesData[0].name
        secondMovieLabel.text = moviesData[1].name
        thirdMovieLabel.text = moviesData[2].name
        
        // Match the appropriate images with those names
        firstMovieImg.image = UIImage(named: moviesData[0].image)
        secondMovieImg.image = UIImage(named: moviesData[1].image)
        thirdMovieImg.image = UIImage(named: moviesData[2].image)
    }
    
    // This function reads the movie data from system memory
    func readMovieData() -> [MoviesData] {
        // Read the movies from user defaults
        let defaults = UserDefaults.standard
        
        if let moviesArray = defaults.value(forKey: USER_DEFAULT_MOVIES_DATA) as? Data {
            if let decodedArray = try? PropertyListDecoder().decode(Array<MoviesData>.self, from: moviesArray) {
                return decodedArray
            } else {
                return []
            }
        } else {
            return []
        }
    }
    
    @IBAction func onBuyClick(_ sender: Any)
    {
        UserDefaults.standard.set(firstMovie, forKey: MOVIE_NAME)
        UserDefaults.standard.set(moviesData[0].price, forKey: MOVIE_PRICE)
        self.performSegue(withIdentifier: "buySegue", sender: nil)
    }
    @IBAction func onBuyClick2(_ sender: Any)
    {
        UserDefaults.standard.set(secondMovie, forKey: MOVIE_NAME)
        UserDefaults.standard.set(moviesData[1].price, forKey: MOVIE_PRICE)
        self.performSegue(withIdentifier: "buySegue", sender: nil)
    }
    @IBAction func onBuyClick3(_ sender: Any) {
        UserDefaults.standard.set(thirdMovie, forKey: MOVIE_NAME)
        UserDefaults.standard.set(moviesData[2].price, forKey: MOVIE_PRICE)
        self.performSegue(withIdentifier: "buySegue", sender: nil)
    }
}
