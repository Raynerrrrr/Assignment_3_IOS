//
//  ViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 13/5/2022.
//

import UIKit

struct MoviesData: Codable {
    var name: String
    var image: String
    var price: String
}

class HomeViewController: UIViewController
{
    var movieArray: [MoviesData] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieArray.append(MoviesData(name: "The Lost City", image: "the_lost_city.jpeg", price: "8.50"))
        movieArray.append(MoviesData(name: "Home Alone", image: "home_alone.jpeg", price: "10.00"))
        movieArray.append(MoviesData(name: "Frozen", image: "frozen.jpeg", price: "6.00"))
        
        writeMovieData()
        
    }
    
    // This function writes the movie data to the user defaults
    func writeMovieData() {
        // Save the array to the user defaults
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(movieArray), forKey: USER_DEFAULT_MOVIES_DATA)
        
        
//        defaults.set(try? PropertyListEncoder().encode(MoviesData), forKey: USER_DEFAULT_MOVIES_DATA)
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

