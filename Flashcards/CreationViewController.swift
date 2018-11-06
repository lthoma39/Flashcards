//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Latrell Thomas on 10/27/18.
//  Copyright © 2018 Latrell Thomas. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBOutlet weak var answerOption1: UITextField!
    @IBOutlet weak var answerOption2: UITextField!
    @IBOutlet weak var answerOption3: UITextField!
    @IBOutlet weak var answerOption4: UITextField!
    
    
    var initialQuestion: String?
    var initialAnswer: String?
    
    var initialQ1: String?
    var initialQ2: String?
    var initialQ3: String?
    var initialQ4: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Do any additional setup after loading the view.
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
    }
    
    @IBAction func didTapOnCancel(_ sender: Any){
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any){
        
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        
        //for passing into the update flashcard method 
        let opt1 = answerOption1.text
        let opt2 = answerOption2.text
        let opt3 = answerOption3.text
        let opt4 = answerOption4.text
        
        if (questionText == nil || answerText == nil || questionText!.isEmpty || questionText!.isEmpty){
            let alert = UIAlertController(title: "Missing text", message: "Make sure to provide text for both Question and Answer", preferredStyle: .alert)
            present(alert, animated: true)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
        }
        else{
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, option1: opt1!, option2: opt2!, option3: opt3!, option4: opt4!)
            
            dismiss(animated: true)
        }
        
        
        
        
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
