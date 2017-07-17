//
//  ViewController.swift
//  TapMeFast
//
//  Created by administrator on 7/13/17.
//  Copyright © 2017 Kirstie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var tapMeButton: UIButton!
    @IBOutlet weak var startGameButton: UIButton!
    
    var timer = Timer()
    var timeInt = 0
    var tapInt = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeInt = 5
        tapInt = 0
        timerLabel.text = String(timeInt)
        scoreLabel.text = String(tapInt)
        
        tapMeButton.isEnabled = false
        tapMeButton.alpha = 0.5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TapMe(_ sender: Any) {
        
        tapInt += 1
        scoreLabel.text = String(tapInt)
        
    }
    
    @IBAction func StartGame(_ sender: Any) {
        
        if timeInt == 5 {
            
            tapInt = 0
            scoreLabel.text = String(tapInt)
            tapMeButton.isEnabled = true
            tapMeButton.alpha = 1
            
            startGameButton.isEnabled = false
            startGameButton.alpha = 0.5
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startCounter), userInfo: nil, repeats: true)
            
        }
        
        if timeInt == 0 {
            
            timeInt = 5
            tapInt = 0
            timerLabel.text = String(timeInt)
            scoreLabel.text = String (tapInt)
            
            startGameButton.setTitle("START GAME", for: [])
            
        }
        
    }
    
    func startCounter () {
        
        timeInt -= 1
        timerLabel.text = String(timeInt)
        
        if timeInt == 0 {
            
            timer.invalidate()
            tapMeButton.isEnabled = false
            tapMeButton.alpha = 0.5
            startGameButton.isEnabled = true
            startGameButton.alpha = 1
            startGameButton.setTitle("RESTART", for: [])
            
        }
        
    }
    
    


}

