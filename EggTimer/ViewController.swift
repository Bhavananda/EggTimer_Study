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
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var MainText: UILabel!

    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 5]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTime[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        MainText.text = hardness
        
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)

            
        
}
    

@objc func updateCounter() {
    //example functionality
    if secondsPassed < totalTime {
              
        secondsPassed += 1
        progressBar.progress = Float(secondsPassed) / Float(totalTime)
        print (Float(secondsPassed) / Float(totalTime))}

    
    else {
        playSound()
        timer.invalidate()
        MainText.text = "DONE"
        
    }
    }
}

