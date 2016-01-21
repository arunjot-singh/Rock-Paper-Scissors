//
//  ResultVewController.swift
//  Rock Paper Scissors
//
//  Created by Arunjot Singh on 1/9/16.
//  Copyright © 2016 Arunjot Singh. All rights reserved.
//

import Foundation
import UIKit


enum Shapes: String{
    
    case Rock
    case Paper
    case Scissors
    
    static func randomChoice() -> Shapes {
        let shape = ["Rock", "Paper", "Scissors"]
        let randomValue = Int(arc4random() % 3)
        return Shapes(rawValue: shape[randomValue])!
    }
}

class ResultViewController : UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var History: UIBarButtonItem!
    @IBOutlet weak var Return: UIBarButtonItem!
    

    
    var userChoice : Shapes!
    let opponentChoice : Shapes = Shapes.randomChoice()
    let matchHistory = "cellIdentifier"


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        displayResult()
    }
    
    override func viewDidLoad() {
        displayImage.hidden = false
        displayText.hidden = false
        playAgain.hidden = false
        tableView.hidden = true
        Return.enabled = false
        Return.tintColor = UIColor.clearColor()
    
        
        
    }
    
    func displayResult() {
        var imageName: String
        var resultText: String
        let subtext = "With \(userChoice.rawValue) vs \(opponentChoice.rawValue)"
        print("Before result: \(Results.matches.capacity)")
        print("Before result: \(Results.matches)")
        switch (userChoice!, opponentChoice) {
        case (.Rock, .Rock), (.Paper, .Paper) ,(.Scissors, .Scissors):
            resultText = "\(subtext), it is a tie"
            imageName = "tie"
            
        case (.Rock, .Scissors):
            resultText = "Rock crush Scissors. You Win! :D"
            imageName = "\(userChoice.rawValue) - \(opponentChoice.rawValue)"
            
        case (.Scissors, .Paper):
            resultText = "Scissors cut Paper. You Win! :D"
            imageName = "\(userChoice.rawValue) - \(opponentChoice.rawValue)"
            
        case (.Paper, .Rock):
            resultText = "Paper covers Rock. You Win! :D"
            imageName = "\(userChoice.rawValue) - \(opponentChoice.rawValue)"
            
        case (.Scissors, .Rock):
            resultText = "Scissor gets crushed by Rock. You Lose! :("
            imageName = "\(opponentChoice.rawValue) - \(userChoice.rawValue)"
            
        case (.Paper, .Scissors):
            resultText = "Paper gets cut by Scissors. You Lose! :("
            imageName = "\(opponentChoice.rawValue) - \(userChoice.rawValue)"
            
        default:
            resultText = "Rock gets covered by Paper. You Lose! :("
            imageName = "\(opponentChoice.rawValue) - \(userChoice.rawValue)"
        }
        
        imageName = imageName.lowercaseString
        displayImage.image = UIImage(named: imageName)
        displayText.text = resultText
        Results.matches.append(resultText)
        print("After result: \(Results.matches.capacity)")
        print("After result: \(Results.matches)")
    }
    
    
 
    @IBAction func matchResults(sender: UIBarButtonItem) {
        
        tableView.hidden = false
        displayText.hidden = true
        displayImage.hidden = true
        playAgain.hidden = true
        History.enabled = false
        History.tintColor = UIColor.clearColor()
        Return.enabled = true
        Return.tintColor = UIColor.blackColor()
    }
    
    @IBAction func Return(sender: UIBarButtonItem) {
        
        tableView.hidden = true
        displayImage.hidden = false
        displayText.hidden = false
        playAgain.hidden = false
        History.enabled = true
        History.tintColor = UIColor.blackColor()
        Return.enabled = false
        Return.tintColor = UIColor.clearColor()
    }
    
    @IBAction func playAgain(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        }
    
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Results.matches.count
    }
    
        var firstIndex = 0
        var lastIndex = Results.matches.count - 1

        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.matchHistory)! as UITableViewCell
            

            
            
           let array = Results.matches[indexPath.row]
           cell.textLabel?.text = array
        
         return cell
    }
    
}


