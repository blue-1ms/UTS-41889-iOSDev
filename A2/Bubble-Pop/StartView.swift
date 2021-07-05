//
//  StartSttingsViewController.swift
//  Bubble-Pop
//
//  Created by blue on 31/3/21.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {
    //connect to main storyboard.
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var playerName: UITextField!
    
    @IBOutlet weak var gameSlider: UISlider!
    
    @IBOutlet weak var bubbleSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerName.delegate = self
    }
    
    //change slider for time limit.
    @IBAction func durationSliderChange(_ sender: UISlider) {
        let timeSliderValue = Int(sender.value)
        timeLabel.text = "\(timeSliderValue)"
    }
    
    //change slider for numbers of bubbles showing.
    @IBAction func bubbleSliderChange(_ sender: UISlider) {
        let numberSliderValue = Int(sender.value)
        numberLabel.text = "\(numberSliderValue)"
    }
    
    //default duration for bubbles and time.
    var numberSliderValue = 15
    var timeSliderValue = 60
    
    //function to start game and pass on info to main game.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let timeDuration = Int(gameSlider.value)
        let numberBubble = Int(bubbleSlider.value)
        
                if segue.identifier == "start" {
                    let dest = segue.destination as! GameViewController
                    dest.maxBubbleNumber = numberBubble
                    dest.remainingSeconds = timeDuration
                    dest.playerName = playerName.text!
                }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let currentText = textField.text {
            if currentText.count > 10 {
                textField.deleteBackward()
            } else {
                textField.resignFirstResponder()
            }
        }
        
        return true
    }
}
