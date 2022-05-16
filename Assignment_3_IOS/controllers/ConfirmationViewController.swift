//
//  ConfirmationViewController.swift
//  Assignment_3_IOS
//
//  Created by Christopher Rayner Halim on 16/5/2022.
//

import UIKit

class ConfirmationViewController: UIViewController
{
    @IBOutlet weak var seatLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onConfirmClick(_ sender: Any)
    {
        _ = navigationController?.popToRootViewController(animated: true)
    }
}

