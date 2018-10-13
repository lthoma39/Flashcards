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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        FrontLabel.isHidden = true;
    }
}

