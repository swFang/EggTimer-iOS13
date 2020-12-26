//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct EggTimers {
        static let soft = 5.0 * 60.0
        static let medium = 8.0 * 60.0
        static let hard = 12.0 * 60.0
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        startTimer(hardness: sender.currentTitle!)
    }
    
    func startTimer(hardness: String) {
        switch hardness {
        case "Hard":
            Timer.scheduledTimer(timeInterval: EggTimers.hard * 60.0, target: self, selector: #selector(timerEnded), userInfo: nil, repeats: false)
            print("hard timer started")
        case "Medium":
            Timer.scheduledTimer(timeInterval: EggTimers.medium, target: self, selector: #selector(timerEnded), userInfo: nil, repeats: false)
            print("medium timer started")
        default:
            Timer.scheduledTimer(timeInterval: EggTimers.soft, target: self, selector: #selector(timerEnded), userInfo: nil, repeats: false)
            print("soft timer started")
        }
    }
    
    @objc func timerEnded() {
        // play noise here
        print("timer ended")
    }
    
}
