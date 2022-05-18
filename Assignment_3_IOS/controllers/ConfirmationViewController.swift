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
    var seats: String
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
    var userMovieData: [UserMovieData] = []
    var name: String = ""
    var time: String = ""
    var userSeats: [String] = []
    var seats: String = ""
    var price: String = ""
    
    @IBOutlet weak var movieLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var seatLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Retrieve the users movie choices from memory
        name = UserDefaults.standard.string(forKey: MOVIE_NAME)!
        time = UserDefaults.standard.string(forKey: MOVIE_TIME)!
        userSeats = readUserSeats()
        price = UserDefaults.standard.string(forKey: MOVIE_PRICE)!
        
        // Update the labels with the users choices
        movieLabel.text = name
        timeLabel.text = time
        
        let seatCount = userSeats.count
        seats = userSeats[0]
        if seatCount > 1 {
            var x = 0
            for i in 1...(seatCount - 1) {
                x += 1
                seats = seats + ", \(userSeats[x])"
            }
        }
        seatLabel.text = seats
        
        let totalPrice: Double = Double(seatCount) * Double(price)!
        priceLabel.text = "$\(price) x \(seatCount) = $\(totalPrice)0"
    }
    
    func writeUsersData() {
        // Write the user's movie data to the user defaults to allow
        // for the movie to be seen in the 'My Tickets' screen
        // Append the data to the array
        userMovieData.append(UserMovieData(name: name, time: time, seats: seats, price: price))
        // Save the array to the user defaults
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(userMovieData), forKey: USER_DEFAULT_USERS_DATA)
    }
    
    func readUserSeats() -> [String] {
        // Read the user's seats from user defaults
        let defaults = UserDefaults.standard
        if let seatsArray = defaults.value(forKey: MOVIE_SEAT) as? Data {
            if let decodedArray = try? PropertyListDecoder().decode(Array<String>.self, from: seatsArray) {
                return decodedArray
            } else {
                return []
            }
        } else {
            return []
        }
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

