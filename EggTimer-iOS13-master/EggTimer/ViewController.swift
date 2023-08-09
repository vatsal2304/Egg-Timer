//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let eggTime = ["Soft": 300, "Medium": 420, "Hard": 720 ]
    
//    var counter = 60
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()

    @IBOutlet weak var ProcessView: UIProgressView!
    
    @IBOutlet weak var titleLable: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        timer.invalidate()
        
        ProcessView.progress = 0.0
        
        secondsPassed = 0
        
        titleLable.text = hardness
        
        totalTime = eggTime[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func updateCounter() {
        //example functionality
        if secondsPassed <= totalTime {
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            
            ProcessView.progress = percentageProgress
            
            secondsPassed += 1
        } else{
            timer.invalidate()
            titleLable.text = "DONE!! Your Eggs Are Ready To Eat"
        }
    }
    
    
    

}
