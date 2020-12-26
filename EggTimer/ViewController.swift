//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    let EggTimers = ["Soft": 5.0 * 60.0 , "Medium": 8.0 * 60.0, "Hard": 12.0 * 60.0]
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    // init to -1 so we know timer didnt start
    var timeRemaining = -1.0
    var totalTime = -1.0
    var timer = Timer()
    var player: AVAudioPlayer?

    @IBAction func hardnessSelected(_ sender: UIButton) {
        self.timer.invalidate()
        progressBar.progress = 0.0
        titleLabel.text = "Cooking in Progress"
        totalTime = EggTimers[sender.currentTitle!]!
        startTimer(hardness: sender.currentTitle!)
    }
    
    func startTimer(hardness: String) {
        timeRemaining = EggTimers[hardness]!
        
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(stepTimer), userInfo: nil, repeats: true)
    }

    @objc func stepTimer() {
        self.timeRemaining = self.timeRemaining - 1
        let percentage = progressPercentage()
        progressBar.progress = percentage

        if (self.timeRemaining <= 0) {
            timerComplete()
        }
    }
    
    func progressPercentage() -> Float {
        return 1.0 - (Float(self.timeRemaining) / Float(self.totalTime))
    }
    
    func timerComplete() {
        self.timer.invalidate()
        titleLabel.text = "Egg Complete!"
        playSound()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
    
}
