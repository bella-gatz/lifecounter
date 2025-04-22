//
//  ViewController.swift
//  lifecounter2
//
//  Created by Bella Gatzemeier on 4/21/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var player1Lives = 20
    var player2Lives = 20

    @IBOutlet weak var player1LifeLabel: UILabel!
    
    @IBOutlet weak var player2LifeLabel: UILabel!
    
    @IBOutlet weak var loserLabel: UILabel!

    // player 1 buttons
    @IBAction func p1plus1(_ sender: Any) {
        updateLives(player: 1, lives: 1)
    }
    
    @IBAction func p1minus1(_ sender: Any) {
        updateLives(player: 1, lives: -1)
    }
    
    @IBAction func p1plus5(_ sender: Any) {
        updateLives(player: 1, lives: 5)
    }
    
    @IBAction func p1minus5(_ sender: Any) {
        updateLives(player: 1, lives: -5)
    }
    
    // player 2 buttons
    @IBAction func p2plus1(_ sender: Any) {
        updateLives(player: 2, lives: 1)
    }
    
    @IBAction func p2minus1(_ sender: Any) {
        updateLives(player: 2, lives: -1)
    }
    
    @IBAction func p2plus5(_ sender: Any) {
        updateLives(player: 2, lives: 5)
    }
    
    @IBAction func p2minus5(_ sender: UIButton) {
        updateLives(player: 2, lives: -5)
    }
    
    func updateLives(player p : Int, lives l : Int) {
        // updates lives
        if p == 1 {
            player1Lives += l
            player1LifeLabel.text = "\(player1Lives)"
         } else {
            player2Lives += l
            player2LifeLabel.text = "\(player2Lives)"
        }
        
        // checks for loss
        if (player1Lives <= 0) {
            loserLabel.text = "Player 1 LOSES!"
        } else if player2Lives <= 0 {
            loserLabel.text = "Player 2 LOSES!"
        } else {
            loserLabel.text = ""
        }
    }
    
}



