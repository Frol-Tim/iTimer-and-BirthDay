//
//  ViewController.swift
//  iTimer
//
//  Created by Timofey on 26.03.2022.
//  Copyright © 2022 Timofey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var addRowButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    var addRowButtonState: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startStopTapped(_ sender: Any) {
        if (timerCounting) {
        timerCounting = false
         startStopButton.setTitle("Start", for: .normal)
             addRowButton.setTitle("Reset", for: .normal)
            timer.invalidate()
        }
        else {
            timerCounting = true
            startStopButton.setTitle("Pause", for: .normal)
            addRowButton.isEnabled = true
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func addRowTapped(_ sender: Any) {
         if (addRowButtonState) {
               addRowButtonState = false
                    addRowButton.setTitle("Reset", for: .normal)
               }
               else {
                   addRowButtonState = true
                addRowButton.setTitle("Lap", for: .normal)
                startStopButton.setTitle("Start", for: .normal)
                    timer.invalidate()
                   count = 0
                  timerLabel.text = makeTimeString(hours: 0, minutes: 0, seconds: 0)
            
        }
    }
    @objc func timerCounter() -> Void
    {
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        timerLabel.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) -> (Int, Int, Int)
    {
        return((seconds / 3600), (seconds % 3600) / 60, (( seconds % 3600) % 60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int) -> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        return timeString
    }
}

