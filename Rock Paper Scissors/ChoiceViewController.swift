//
//  ChoiceViewController.swift
//  Rock Paper Scissors
//
//  Created by Arunjot Singh on 1/9/16.
//  Copyright © 2016 Arunjot Singh. All rights reserved.
//

import UIKit

struct Results {
    static var matches: [String] = []
}


class ChoiceViewController: UIViewController {

    @IBAction func Rock(sender: UIButton) {
                performSegueWithIdentifier("play", sender: sender)
    }
  
    @IBAction func Paper(sender: UIButton) {
        performSegueWithIdentifier("play", sender: sender)
    }
    
    @IBAction func Scissors(sender: UIButton) {
        performSegueWithIdentifier("play", sender: sender)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "play" {
            let vc = segue.destinationViewController as! ResultViewController
            vc.userChoice = getUserShape(sender as! UIButton)
        }
    }

    private func getUserShape(sender: UIButton) -> Shapes {
        // Titles are set to one of: Rock, Paper, or Scissors
        let shape = sender.titleForState(.Normal)!
        return Shapes(rawValue: shape)!
    }

}

