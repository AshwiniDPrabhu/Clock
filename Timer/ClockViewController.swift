//
//  ClockViewController.swift
//  Timer
//
//  Created by Ashwini Prabhu on 3/8/20.
//  Copyright © 2020 experiment. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController{
    
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTime()
    }
    
    func getTime(){
        let date = Date()
        let calendar = NSCalendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        dateText.text = String(format:"%02i:%02i:%02i", hour, minute, second)
        
        let year = calendar.component(.year, from: date)
        let month = Date().month
        let day = calendar.component(.day, from: date)
        
        dayLabel.text = String(format:"%02i,%@ %04i", day, month, year)
    }
}

extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
}
