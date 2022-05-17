//
//  ConfirmationViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 16/5/2022.
//

import UIKit

struct UserMovieData: Codable {
    var name: String
    var time: String
    var seat: String
    var price: String
}

let MOVIE_NAME = "movieName"
let MOVIE_TIME = "movieTime"
let MOVIE_SEAT = "movieSeat"
let MOVIE_PRICE = "moviePrice"
let USER_DEFAULT_USERS_DATA = "usersData"
let USER_DEFAULT_MOVIES_DATA = "moviesData"

class ConfirmationViewController: UIViewController
{
    var name: String = ""
    var time: String = ""
    var seat: String = ""
    var price: String = ""
    var userMovieData: [UserMovieData] = []
    
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var seatLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name = UserDefaults.standard.string(forKey: MOVIE_NAME)!
        time = UserDefaults.standard.string(forKey: MOVIE_TIME)!
        seat = UserDefaults.standard.string(forKey: MOVIE_SEAT)!
        price = UserDefaults.standard.string(forKey: MOVIE_PRICE)!
    }
    
    func writeUsersData() {
        // Write the user's movie data to the user defaults to allow
        // for the movie to be seen in the 'My Tickets' screen
        // Append the data to the array
        userMovieData.append(UserMovieData(name: name, time: time, seat: seat, price: price))
        // Save the array to the user defaults
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(userMovieData), forKey: USER_DEFAULT_USERS_DATA)
    }
    
    @IBAction func onConfirmClick(_ sender: Any)
    {
        
        // Update the MyTickets data
        writeUsersData()
        
        // Reset the User Defaults
        UserDefaults.standard.set("", forKey: MOVIE_NAME)
        UserDefaults.standard.set("", forKey: MOVIE_TIME)
        UserDefaults.standard.set("", forKey: MOVIE_SEAT)
        UserDefaults.standard.set("", forKey: MOVIE_PRICE)
        
        // Navigate to the home screen
        _ = navigationController?.popToRootViewController(animated: true)
    }
}

