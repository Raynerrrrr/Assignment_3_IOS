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
        seats.setAvailableImage(   UIImage(named: "A")!,
            andUnavailableImage:    UIImage(named: "U")!,
            andDisabledImage:       UIImage(named: "D")!,
            andSelectedImage:       UIImage(named: "S")!)
        seats.layout_type = "Normal"
        seats.setMap(seatMap)
        seats.selected_seat_limit  = 5
        seats.seatSelectorDelegate = self
        seats.maximumZoomScale         = 5.0
        seats.minimumZoomScale         = 0.05
        self.view.addSubview(seats)
        
        
    }
    
    func seatSelected(_ seat: Seat) {
//        print("Seat at row: \(seat.row) and column: \(seat.column)\n")
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
        if seat.selected_seat {
            userSeats.append(seatData)
            print(userSeats)
        } else {
                var x = -1
                for i in userSeats {
                    x += 1
                    if seatData == i {
                        userSeats.remove(at: x)
                    }
                }
            print(userSeats)
        }
    }
    
    func getSelectedSeats(_ seats: NSMutableArray) {
        for i in 0..<seats.count {
            let seat: Seat  = seats.object(at: i) as! Seat
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
//            seatData = seatRow + seatNumber
//            print(seatData)
        }
    }
    
    func saveSeatData() {
        userSeats.removeAll()
        userSeats.append(seatData)
        print(userSeats)
    }
    
    @IBAction func onConfirmClick(_ sender: Any)
    {
//        saveSeatData()
        userSeats.append(seatData)
        print(userSeats)
        if userSeats.isEmpty {
            
        } else {
            //        self.performSegue(withIdentifier: "confirmSegue", sender: nil)
        }
    }
}
