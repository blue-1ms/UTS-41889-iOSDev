//
//  HighScoreView.swift
//  Bubble-Pop
//
//  Created by blue on 31/3/21.
//

import Foundation
import UIKit

class HighScoreViewController: UIViewController {
    var Ranking = [String : Int]()
    var HSArray = [(key: String, value: Int)]()
    
    //connect to storyboard to update highscore information.
    @IBOutlet weak var player1: UILabel!
    
    @IBOutlet weak var player2: UILabel!
    
    @IBOutlet weak var player3: UILabel!
    
    @IBOutlet weak var highScore2: UILabel!
    
    @IBOutlet weak var highScore1: UILabel!
    
    @IBOutlet weak var highScore3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sort ranking array by player's score.
        if let Ranking = UserDefaults.standard.dictionary(forKey: "ranking") as! [String : Int]? {
            HSArray = Ranking.sorted(by: {$0.value > $1.value})
            
            if HSArray.count == 1 {
                player1.text = HSArray[0].key
                highScore1.text = "\(HSArray[0].value)"
            } else if HSArray.count == 2 {
                player1.text = HSArray[0].key
                player2.text = HSArray[1].key
                highScore1.text = "\(HSArray[0].value)"
                highScore2.text = "\(HSArray[1].value)"
            } else {
                player1.text = HSArray[0].key
                player2.text = HSArray[1].key
                player3.text = HSArray[2].key
                highScore1.text = "\(HSArray[0].value)"
                highScore2.text = "\(HSArray[1].value)"
                highScore3.text = "\(HSArray[2].value)"
            }
        }
    }
    //function to close the high score window
    @IBAction func dismiss(_ sender: Any) {
        let destinationView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        present(destinationView, animated: true, completion: nil)
    }
}
