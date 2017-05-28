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
        case Substract = "-"
        case Add = "+"
        case Empty = "Empty"
        case Clear = "Clear"
        
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
        
        outputLbl.text = "0"
    
    }
    
    
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        
        runningNumber += "\(sender.tag)"
        
        outputLbl.text = runningNumber
        
    }
    
    
    @IBAction func onDevidePressed(sender: AnyObject) {
            processOperation(operation: .Devide)
    }
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(operation: .Multiply)
    }
    @IBAction func onSubstractPressed(sender: AnyObject) {
        processOperation(operation: .Substract)
    }
    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(operation: .Add)
    }
    @IBAction func onClearPressed(sender: AnyObject) {
        processOperation(operation: .Clear)
    }
    
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(operation: currentOperation)
    }
    
    func playSound() {
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
        
    }
    
    

    
    func processOperation(operation: Operation) {
    
        playSound()
        
        if currentOperation != Operation.Empty{
            //A user selected operator, but than selected another operator without first entering a number
            
            if runningNumber != "" {

                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Devide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                } else if currentOperation == Operation.Substract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Clear {
                    result = "0"
                }
                
                leftValStr = result
                outputLbl.text = result
                
            }
            
            currentOperation = operation
        }   else {
            
            //This is the first time when operator has been pressed
          
            leftValStr = runningNumber
            
            runningNumber = ""
            
            currentOperation = operation
        
        }
        
    }
    
    
}
    
    



