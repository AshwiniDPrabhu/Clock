//
//  StopWatchViewController.swift
//  Timer
//
//  Created by Ashwini Prabhu on 3/8/20.
//  Copyright © 2020 experiment. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController{

    @IBOutlet weak var timeLabel: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    func timeString(time:TimeInterval) -> String {
        let second = Int(time) % 60
        return String(format:"%02i", second)
    }
    
      var seconds = 60
      var timer = Timer()
      var isTimerRunning = false
      
      override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.delegate = self
      }
    
    @IBAction func startWatch(_ sender: Any) {
        let timeValue = timeLabel.text
        print(timeValue!)
        
        if(isTimerRunning) {
            return
        }
        startButton.isEnabled = false
            
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc func UpdateTimer() {
        seconds = Int(timeLabel.text!)!
        
        if(seconds == 0){
            timer.invalidate()
        }
        
        seconds-=1
        timeLabel.text = String(seconds)
        
        if(seconds == 0){
            timer.invalidate()
        }
    }
    
    @IBAction func stopWatch(_ sender: Any) {
        timer.invalidate()
        seconds = 0
        timeLabel.text = timeString(time: TimeInterval(seconds))
        self.startButton.isEnabled = true
    }
}

extension StopWatchViewController: UITextFieldDelegate{
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
