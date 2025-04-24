//
//  ViewController.swift
//  lifecounter2
//
//  Created by Bella Gatzemeier on 4/21/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        p1Text.delegate = self
        p1Text.keyboardType = .numberPad
        p2Text.delegate = self
        p2Text.keyboardType = .numberPad
        addPlayerButton.isHidden = false
        // Do any additional setup after loading the view.
    }
    
    var player1Lives = 20
    var player2Lives = 20
    var numPlayers = 4
    var players : [player] = [] // add first four players
    var gameStart = false // TODO: add true when life totals changed
    
    @IBOutlet weak var player1LifeLabel: UILabel!
    
    @IBOutlet weak var player2LifeLabel: UILabel!
    
    @IBOutlet weak var loserLabel: UILabel!

        
    @IBOutlet weak var addPlayerButton: UIButton!
    
    @IBAction func addPlayer(_ sender: Any) {
        if numPlayers < 8 {
            numPlayers += 1
            players.append(player(numPlayers))
            print(numPlayers)
        } else {
            addPlayerButton.isHidden = true
        }
    }
    
    // TODO: add func for four players --> add to class?
    
    // player 1
    @IBAction func p1plus1(_ sender: Any) {
        updateLives(player: 1, lives: 1)
    }
    
    @IBAction func p1minus1(_ sender: Any) {
        updateLives(player: 1, lives: -1)
    }
    
    @IBOutlet weak var p1Text: UITextField!

    @IBOutlet weak var p1plusminus: UISegmentedControl!
        
    @IBAction func p1LifeReq(_ sender: Any) {
        if let text = p1Text.text, let number = Int(text) {
            if p1plusminus.selectedSegmentIndex == 1 {
                updateLives(player: 1, lives: number * -1)
            } else {
                updateLives(player: 1, lives: number)
            }
        } else {
             print("Please enter a valid number")
        }
        p1Text.text = ""
    }

    // player 2
    
    @IBAction func p2plus1(_ sender: Any) {
        updateLives(player: 2, lives: 1)
    }
    
    @IBAction func p2minus1(_ sender: Any) {
        updateLives(player: 2, lives: -1)
    }

    @IBOutlet weak var p2Text: UITextField!

    @IBOutlet weak var p2plusminus: UISegmentedControl!
    
    @IBAction func p2LifeReq(_ sender: Any) {
        if let text = p2Text.text, let number = Int(text) {
            if p2plusminus.selectedSegmentIndex == 1 {
                updateLives(player: 2, lives: number * -1)
            } else {
                updateLives(player: 2, lives: number)
            }
        } else {
             print("Please enter a valid number")
        }
        p2Text.text = ""
    }
    
    func updateLives(player p : Int, lives l : Int) {
        gameStart = true
        if gameStart == true {
            addPlayerButton.isHidden = true
        }
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
            print("Player 1 LOSES!")
            addPlayerButton.isHidden = false

        } else if player2Lives <= 0 {
            loserLabel.text = "Player 2 LOSES!"
            print("Player 2 LOSES!")
            addPlayerButton.isHidden = false
        } else {
            loserLabel.text = ""
        }
    }
    
}

class player {
    var num: Int
    var lives : Int
    
    init(_ num : Int) {
        self.num = num
        self.lives = 20
    }
}



