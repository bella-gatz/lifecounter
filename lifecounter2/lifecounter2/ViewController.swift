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
        
        // adding first four players
        for num in 1...4 {
            let player = player(num)
            players.append(player)

            // UI
            let playerView = PlayerView()
            playerView.setupUI(player: player)
            playersStackView.addArrangedSubview(playerView)
//            print(player.num)
        }
    }
    
    var numPlayers = 4
    var players : [player] = []// add first four players
    var gameStart = false // TODO: add true when life totals changed
    
    @IBOutlet weak var playersStackView: UIStackView!
    
    @IBOutlet weak var player1LifeLabel: UILabel!// TODO: delete
    
    @IBOutlet weak var player2LifeLabel: UILabel! // TODO: delete
    
    @IBOutlet weak var loserLabel: UILabel!

    @IBOutlet weak var addPlayerButton: UIButton!
    
    @IBAction func historyButton(_ sender: Any) {
        // shows history
    }
    
    @IBAction func addPlayer(_ sender: Any) {
        if numPlayers < 8 {
            numPlayers += 1
            let newPlayer = player(numPlayers)
            players.append(newPlayer)
            print(numPlayers)
            
            // UI
            let playerView = PlayerView()
            playerView.setupUI(player: newPlayer)
            playersStackView.addArrangedSubview(playerView)
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
    
    @IBOutlet weak var p1Text: UITextField! // TODO: delete

    @IBOutlet weak var p1plusminus: UISegmentedControl! // TODO: delete
        
    @IBAction func p1LifeReq(_ sender: Any) { // TODO: delete
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
    
    @IBAction func p2plus1(_ sender: Any) { // TODO: delete
        updateLives(player: 2, lives: 1)
    }
    
    @IBAction func p2minus1(_ sender: Any) { // TODO: delete
        updateLives(player: 2, lives: -1)
    }

    @IBOutlet weak var p2Text: UITextField! // TODO: delete

    @IBOutlet weak var p2plusminus: UISegmentedControl! // TODO: delete
    
    @IBAction func p2LifeReq(_ sender: Any) { // TODO: delete
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
        players[p - 1].lives += l
        // TODO: update the right life label for each player
        player1LifeLabel.text = "\(players[p - 1].lives)"

        
        // checks for loss
        if (players[0].lives <= 0) {
            loserLabel.text = "Player 1 LOSES!"
            print("Player 1 LOSES!")
            addPlayerButton.isHidden = false
        } else if players[1].lives <= 0 {
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

class PlayerView: UIView {
    var player: player!
    
    let nameLabel = UILabel()
    let lifeLabel = UILabel()
    let plusButton = UIButton()
    let minusButton = UIButton()
    let applyButton = UIButton()
    let plusMinus = UISegmentedControl(items: ["+", "-"])
    let text = UITextField()
    
    func setupUI(player : player) {
        self.player = player
        nameLabel.text = "Player \(player.num)"
        lifeLabel.text = "\(player.lives)"
    }
}


