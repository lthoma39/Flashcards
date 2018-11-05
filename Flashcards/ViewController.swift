//
//  ViewController.swift
//  Flashcards
//
//  Created by Latrell Thomas on 10/13/18.
//  Copyright © 2018 Latrell Thomas. All rights reserved.
//
//2/3 optionals done

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FrontLabel: UILabel!
    @IBOutlet weak var BackLabel: UILabel!
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    @IBOutlet weak var btnOptionFour: UIButton!
    
    
    @IBOutlet weak var retButton: UIButton!
    
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
        
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        btnOptionOne.layer.cornerRadius = 20.0
        
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        btnOptionTwo.layer.cornerRadius = 20.0
        
        btnOptionThree.layer.borderWidth = 3.0
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        btnOptionThree.layer.cornerRadius = 20.0
        
        btnOptionFour.layer.borderWidth = 3.0
        btnOptionFour.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        btnOptionFour.layer.cornerRadius = 20.0
        
        retButton.layer.borderWidth = 3.0
        retButton.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        retButton.layer.cornerRadius = 20.0
        
        retButton.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        //do nothing
    }
    
    func updateFlashcard(question: String, answer: String, option1: String?, option2: String?, option3: String?, option4: String?){
        
        FrontLabel.text = question
        BackLabel.text = answer
        
        //for changing the multiple choice answers 
        btnOptionOne.setTitle(option1, for: .normal)
        btnOptionTwo.setTitle(option2, for: .normal)
        btnOptionThree.setTitle(option3, for: .normal)
        btnOptionFour.setTitle(option4, for: .normal)
        
    }
    
    @IBAction func didTapOptionOne(_ sender: Any){
        btnOptionOne.isHidden = true
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any){
        btnOptionOne.isHidden = true
        btnOptionThree.isHidden = true
        btnOptionFour.isHidden = true
        
        FrontLabel.isHidden = true;
        view.backgroundColor = UIColor.white
        card.backgroundColor = UIColor.cyan
        BackLabel.backgroundColor = UIColor.cyan
        retButton.isHidden = false
    }
    
    
    @IBAction func didTapOptionThree(_ sender: Any){
         btnOptionThree.isHidden = true
    }
    
    @IBAction func didTapOptionFour(_ sender: Any){
         btnOptionFour.isHidden = true
    }
    
    
    @IBAction func didTapReturn(_ sender: Any){
        if (FrontLabel.isHidden){
            FrontLabel.isHidden = false;
            view.backgroundColor = backgroundColor;
            card.backgroundColor = backgroundColor
            btnOptionOne.isHidden = false
            btnOptionTwo.isHidden = false
            btnOptionThree.isHidden = false
            btnOptionFour.isHidden = false
            card.backgroundColor = backgroundColor
            retButton.isHidden = true
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
        
        if (segue.identifier == "EditSegue"){
            creationController.initialQuestion = FrontLabel.text
            creationController.initialAnswer = BackLabel.text
        }
    }
}

