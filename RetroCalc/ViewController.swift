//
//  ViewController.swift
//  RetroCalc
//
//  Created by Nick on 27.05.17.
//  Copyright © 2017 LagoikoNick. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound: AVAudioPlayer!
    
    
    var runningNumber = ""
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            
            btnSound.prepareToPlay()
            
        } catch let err as NSError {
            
            print(err.debugDescription)
            
        }
    
    }

    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        
        runningNumber += "\(sender.tag)"
        
        outputLbl.text = runningNumber
        
    }
    
    
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
        
    }


}

