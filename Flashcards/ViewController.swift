//
//  ViewController.swift
//  Flashcards
//
//  Created by Latrell Thomas on 10/13/18.
//  Copyright © 2018 Latrell Thomas. All rights reserved.
//
//2/3 optionals done

import UIKit

struct Flashcard {
    var question: String
    var answer: String
    var option1: String
    var option2: String
    var option3: String
    var option4: String
}

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
    
    var flashcards = [Flashcard]()
    var currentIndex = 0
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
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
        
        prevButton.layer.borderWidth = 3.0
        prevButton.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        prevButton.layer.cornerRadius = 20.0
        
        nextButton.layer.borderWidth = 3.0
        nextButton.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        nextButton.layer.cornerRadius = 20.0
        
        retButton.isHidden = true
        
        readSavedFlashcards()
        
        if (flashcards.count == 0){
            updateFlashcard(question: "1 + 1", answer: "2", option1: "4", option2: "2", option3: "3", option4: "1", isExisting: false)
        }
        else{
            updateLabels()
            updatePrevNextButtons()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func didTapOnFlashcard(_ sender: Any) {
        //do nothing
    }
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        
        present(alert, animated: true)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.deleteCurrentFlashcard()
        }
        alert.addAction(deleteAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        
    }
    
    func deleteCurrentFlashcard(){
        flashcards.remove(at: currentIndex)
        
        if (currentIndex > flashcards.count - 1){
            currentIndex = flashcards.count - 1
        }
        
        updatePrevNextButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    
    func updatePrevNextButtons(){
        
        if (currentIndex == flashcards.count - 1){
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        
        if(currentIndex == 0){
            prevButton.isEnabled = false
        }
        else{
            prevButton.isEnabled = true
        }
    }
    
    func updateFlashcard(question: String, answer: String, option1: String?, option2: String?, option3: String?, option4: String?, isExisting: Bool){
        
        let flashcard = Flashcard(question: question, answer: answer, option1: option1!, option2: option2!, option3: option3!, option4: option4!)
        
        if (isExisting){
            flashcards[currentIndex] = flashcard
        }
        else{
            flashcards.append(flashcard)
        }
        
        print("Added a new flashcard")
        print("We now have \(flashcards.count) flashcards")
        
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex) ")
        
        updatePrevNextButtons()
        updateLabels()
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
        prevButton.isHidden = true
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
            prevButton.isHidden = false
        }
    }
    
    @IBAction func didTapPrev(_ sender: Any){
        currentIndex -= 1
        updatePrevNextButtons()
        updateLabels()
        
    }
    
    @IBAction func didTapNext(_ sender: Any){
        
        currentIndex += 1
        updatePrevNextButtons()
        updateLabels()
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
    
    func updateLabels(){
        
        let currentFlashcard = flashcards[currentIndex]
        FrontLabel.text = currentFlashcard.question
        BackLabel.text = currentFlashcard.answer
        if (!(currentFlashcard.option1.isEmpty)){
            btnOptionOne.setTitle(currentFlashcard.option1, for: .normal)
        }
        if (!(currentFlashcard.option2.isEmpty)){
            btnOptionTwo.setTitle(currentFlashcard.option2, for: .normal)
        }
        if (!(currentFlashcard.option3.isEmpty)){
            btnOptionThree.setTitle(currentFlashcard.option3, for: .normal)
        }
        if (!(currentFlashcard.option4.isEmpty)){
            btnOptionFour.setTitle(currentFlashcard.option4, for: .normal)
        }
        
        saveAllFlashcardsToDisk()
    }
    
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as?  [[String: String]]{
            
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!, option1: dictionary["option1"]!, option2: dictionary["option2"]!, option3: dictionary["option3"]!, option4: dictionary["option4"]!)
            }
            
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    func saveAllFlashcardsToDisk(){
        
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer, "option1": card.option1, "option2": card.option2, "option3": card.option3,
                    "option4": card.option4]
        }
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
    }
}

