//
//  HistoryViewController.swift
//  lifecounter2
//
//  Created by Bella Gatzemeier on 4/23/25.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var history : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        historyPlace.text = history.joined(separator: "\n")
    }
    
    
    @IBOutlet weak var historyPlace: UILabel!
    
    func setUp(_ history: [String]) {
        self.history = history
        historyPlace?.text = history.joined(separator: "\n")
//        self.historyPlace = historyPlace
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
