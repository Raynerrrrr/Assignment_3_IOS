//
//  TicketsViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 16/5/2022.
//

import UIKit

class TicketsViewController: UIViewController
{
    var usersTickets: [UserMovieData] = []
    
    @IBOutlet weak var noTicketsLabel: UILabel!
    @IBOutlet weak var ticketsTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usersTickets = readUsersTickets()
        if usersTickets.isEmpty {
            noTicketsLabel.text = "You have 0 tickets. Please go and purchase a movie"
        } else {
            noTicketsLabel.text = ""
        }
    }
    
    func updateUsersTickets() {
        // Update the user's tickets to the user defaults to allow
        // for the tickets to be seen in the 'My Tickets' screen
        // Save the array to the user defaults
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(usersTickets), forKey: USER_DEFAULT_USERS_DATA)
    }
    
    // This function reads the user's tickets from system memory
    func readUsersTickets() -> [UserMovieData] {
        // Read the tickers from user defaults
        let defaults = UserDefaults.standard
        
        if let ticketsArray = defaults.value(forKey: USER_DEFAULT_USERS_DATA) as? Data {
            if let decodedArray = try? PropertyListDecoder().decode(Array<UserMovieData>.self, from: ticketsArray) {
                return decodedArray
            } else {
                return []
            }
        } else {
            return []
        }
    }
    
    
}

// This extension allows for the editing/removal of cells in the table
extension TicketsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let index = indexPath.row
        if (editingStyle == .delete) {
            // remove the deleted cell's data from the array
            usersTickets.remove(at: index)
            // write the updated array back to user defaults
            updateUsersTickets()
            // update the table so the deleted data is not present
            tableView.reloadData()
        }
    }
}

// This extension allows for the creation of cells in the table
extension TicketsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the table
        return usersTickets.count
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?
    {
         return "Refund"
    }
    
    // Dequeue a reusable cell from the table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ticketCells", for: indexPath)
        
        // Update the UI for this cell
        let tickets = usersTickets[indexPath.row]
        
        switch tickets.name {
        case "The Lost City":
            cell.imageView?.image = UIImage(named: "the_lost_city.jpeg")
        case "Home Alone":
            cell.imageView?.image = UIImage(named: "home_alone.jpeg")
        case "Frozen":
            cell.imageView?.image = UIImage(named: "frozen.jpeg")
        default:
            _ = ""
        }
        
        cell.textLabel?.text = tickets.name
        cell.detailTextLabel?.text = "Time: \(tickets.time),  Seat: \(tickets.seats),  $\(tickets.price)"
        
        // Return the cell to the tableview
        return cell
    }
}

