//
//  GameView.swift
//  Bubble-Pop
//
//  Created by blue on 31/3/21.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    //variables for the game.
    var myTimer: Timer?
    var bubble = Bubble()
    var bubbleArray = [Bubble]()
    var remainingSeconds = 60
    var maxBubbleNumber = 15
    var score: Int = 0
    var BubbleValue: Int = 0
    var playerName: String = ""
    var Ranking = [String : Int]()
    var previousRanking: Dictionary? = [String : Int]()
    var HSArray = [(key: String, value: Int)]()
    
    //setup screen width and height within their boundary.
    var screenWidth: UInt32 {
        return UInt32(UIScreen.main.bounds.width)
    }
    var screenHeight: UInt32 {
        return UInt32(UIScreen.main.bounds.height)
    }
    
    //connect to storyboard and display corresponding information.
    @IBOutlet weak var timeRemaining: UILabel!
    
    @IBOutlet weak var currentScore: UILabel!
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousRanking = UserDefaults.standard.dictionary(forKey: "ranking") as? Dictionary<String, Int>
        if previousRanking != nil {
            Ranking = previousRanking!
            HSArray = Ranking.sorted(by: {$0.value > $1.value})
        }
        
        myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.setRemainingTime()
            self.removeBubble()
            self.createBubble()
        }
    }
    
    //function if bubble is tapped and increse score.
    @IBAction func bubbleTapped(_ sender: Bubble) {
        sender.removeFromSuperview()
        if BubbleValue == sender.value {
            score += sender.value * 2
        }
        else {
            score += sender.value
        }
        BubbleValue = sender.value
        currentScore.text = "\(score)"
        
        if  previousRanking == nil {
            highScoreLabel.text = "\(score)"
        } else if HSArray[0].value < score {
            highScoreLabel.text = "\(score)"
        } else if HSArray[0].value >= score {
            highScoreLabel.text = "\(HSArray[0].value)"
        }
    }
        
    //check if bubble is overlapping.
    func isOverlapped(bubbleToCreate: Bubble) -> Bool {
        for currentBubbles in bubbleArray {
            if bubbleToCreate.frame.intersects(currentBubbles.frame) {
             return true
            }
        }
        return false
    }
    
    //create bubble using bubble.swift.
    @objc func createBubble() {
        let numberToCreate = arc4random_uniform(UInt32(maxBubbleNumber - bubbleArray.count)) + 1
        var i = 0
        
        while i < numberToCreate {
            bubble = Bubble()
            bubble.frame = CGRect(x: CGFloat(10 + arc4random_uniform(screenWidth - 2 * bubble.radius - 20)), y: CGFloat(160 + arc4random_uniform(screenHeight - 2 * bubble.radius - 180)), width: CGFloat(2 * bubble.radius), height: CGFloat(2 * bubble.radius))
            if !isOverlapped(bubbleToCreate: bubble) {
                bubble.addTarget(self, action: #selector(bubbleTapped), for: UIControl.Event.touchUpInside)
                self.view.addSubview(bubble)
                bubble.animation()
                i += 1
                bubbleArray += [bubble]
            }
        }
    }
    
    @objc func removeBubble() {
        var i = 0
        while i < bubbleArray.count {
            if arc4random_uniform(100) < 33 {
                bubbleArray[i].removeFromSuperview()
                bubbleArray.remove(at: i)
                i += 1
            }
        }
    }
    
    @objc func setRemainingTime() {
        timeRemaining.text = "\(remainingSeconds)"
        if (remainingSeconds == 0) {
            myTimer!.invalidate()
            checkHighScoreExistence()
            
            let destinationView = self.storyboard?.instantiateViewController(withIdentifier: "HighScoreViewController") as! HighScoreViewController
            present(destinationView, animated: true, completion: nil)
        }
        remainingSeconds -= 1
    }
    
    func saveHighScore() {
        Ranking.updateValue(score, forKey: "\(playerName)")
        UserDefaults.standard.set(Ranking, forKey: "ranking")
    }
    
    func checkHighScoreExistence() {
        if previousRanking == nil {
            saveHighScore()
        }
        else {
            Ranking = previousRanking!
            if Ranking.keys.contains("\(playerName)") {
                let currentScore = Ranking["\(playerName)"]!
                if currentScore < score {
                    saveHighScore()
                }
            } else {
                saveHighScore()
            }
        }
    }
    
    
}
