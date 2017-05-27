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
    
    
    enum Operation: String {
        case Devide = "/"
        case Multiply = "*"
        case Substrack = "-"
        case Add = "+"
        case Empty = "Empty"
        
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
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

    
    func processOperation(operation: Operation) {
        if currentOperation != Operation.Empty{
            //A user selected operator, but than selected another operator without first entering a number
            if runningNumber != "" {

                rightValStr = runningNumber
                runningNumber = ""
                
                
                
            }
        }
        
        
    }
    
    

}

