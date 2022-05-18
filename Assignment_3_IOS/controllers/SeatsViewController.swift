//
//  SeatsViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 15/5/2022.
//

import UIKit

class SeatsViewController: UIViewController, SeatSelectorDelegate
{
    var userSeats: [String] = []
    var seatData: String = ""
    var userSeatsCount: Int = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let seatMap: String =   "_AA_AAAAA_AA_/" +
                                "_AA_AAAAA_AA_/" +
                                "_AA_AAAAA_AA_/" +
                                "_AA_AAAAA_AA_/" +
                                "_AA_AAAAA_AA_/" +
                                "_AA_AAAAA_AA_/" +
                                "_AA_AAAAA_AA_/" +
                                "_AA_AAAAA_AA_/"
        
        let seats = SeatSelector()
        seats.frame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 600)
        seats.setSeatSize(CGSize(width: 30, height: 30))
        seats.setAvailableImage(UIImage(named: "A")!,
            andUnavailableImage: UIImage(named: "U")!,
            andDisabledImage: UIImage(named: "D")!,
            andSelectedImage: UIImage(named: "S")!)
        seats.layout_type = "Normal"
        seats.setMap(seatMap)
        seats.selected_seat_limit = 5
        seats.seatSelectorDelegate = self
        seats.maximumZoomScale = 5.0
        seats.minimumZoomScale = 0.05
        self.view.addSubview(seats)
    }
    
    func seatSelected(_ seat: Seat) {
        let seatNumber = String(seat.column - 1)
        var seatRow = ""
        switch seat.row {
        case 1:
            seatRow = "A"
        case 2:
            seatRow = "B"
        case 3:
            seatRow = "C"
        case 4:
            seatRow = "D"
        case 5:
            seatRow = "E"
        case 6:
            seatRow = "F"
        case 7:
            seatRow = "G"
        case 8:
            seatRow = "H"
        default:
            seatRow = ""
        }
        
        seatData = seatRow + seatNumber
        // Add and remove seats from array
        if seat.selected_seat {
            userSeats.append(seatData)
        } else {
            var x = -1
            for i in userSeats {
                x += 1
                if seatData == i {
                    userSeats.remove(at: x)
                }
            }
        }
        // Update array if user selects more than 5 seats
        if userSeats.count > 5 {
            userSeats.removeFirst()
        }
    }
    
    func getSelectedSeats(_ seats: NSMutableArray) {
        for i in 0..<seats.count {
            let _: Seat  = seats.object(at: i) as! Seat
        }
    }
    
    // This function writes the seat data to the user defaults
    func writeSeatData() {
        // Save the array to the user defaults
        let defaults = UserDefaults.standard
        defaults.set(try? PropertyListEncoder().encode(userSeats), forKey: MOVIE_SEAT)
    }
    
    @IBAction func onConfirmClick(_ sender: Any)
    {
        writeSeatData()
        if userSeats.isEmpty {
            titleLabel.text = "Please Choose a Seat (max: 5)"
            titleLabel.textColor = UIColor.red
        } else {
            self.performSegue(withIdentifier: "confirmSegue", sender: nil)
        }
    }
}
