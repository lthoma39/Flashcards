//
//  ViewController.swift
//  Flashcards
//
//  Created by Latrell Thomas on 10/13/18.
//  Copyright © 2018 Latrell Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FrontLabel: UILabel!
    @IBOutlet weak var BackLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    
    var backgroundColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundColor = view.backgroundColor //for getting the default color
        // Do any additional setup after loading the view, typically from a nib.
        
        card.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        FrontLabel.clipsToBounds = true
        BackLabel.clipsToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        //conditional that toggles based on if the question is hidden
        if (FrontLabel.isHidden){
            FrontLabel.isHidden = false;
            view.backgroundColor = backgroundColor;
            card.backgroundColor = backgroundColor
        }
        else{
            FrontLabel.isHidden = true;
            view.backgroundColor = UIColor.white
            card.backgroundColor = UIColor.cyan
            BackLabel.backgroundColor = UIColor.cyan
        }
    }
}

