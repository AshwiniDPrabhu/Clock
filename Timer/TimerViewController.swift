//
//  ViewController.swift
//  Timer
//
//  Created by Ashwini Prabhu on 3/3/20.
//  Copyright © 2020 experiment. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
  func timeString(time:TimeInterval) -> String {
      let hours = Int(time) / 3600
      let minutes = Int(time) / 60 % 60
      let second = Int(time) % 60
      return String(format:"%02i:%02i:%02i", hours, minutes, second)
  }
    
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    var resumeTapped = false
    
    override func viewDidLoad() {
           super.viewDidLoad()
           pauseButton.isEnabled = false
    }
    
    @IBAction func start(_ sender: Any) {
        if isTimerRunning == false {
            runClock()
            self.startButton.isEnabled = false
        }
    }
    
   func runClock(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.updateTimer), userInfo: nil, repeats: true)
        isTimerRunning = true
        pauseButton.isEnabled = true
    }
    
    @objc  func updateTimer() {
        seconds += 1
        time.text = timeString(time: TimeInterval(seconds))
    }
    
    @IBAction func pause(_ sender: Any) {
         if self.resumeTapped == false {
              timer.invalidate()
              self.resumeTapped = true
              self.pauseButton.setTitle("Resume",for: .normal)
         } else {
              runClock()
              self.resumeTapped = false
              self.pauseButton.setTitle("Pause",for: .normal)
         }
    }

    @IBAction func stop(_ sender: Any) {
        timer.invalidate()
        
        seconds = 0
        time.text = timeString(time: TimeInterval(seconds))
        
        isTimerRunning = false
        self.pauseButton.setTitle("Pause",for: .normal)
        
        pauseButton.isEnabled = false
        self.startButton.isEnabled = true
    }
}


