//
//  seats.swift
//  Assignment_3_IOS
//
//  Created by Aryeh Naar on 16/5/2022.
//

import UIKit

class Seats: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    
}
