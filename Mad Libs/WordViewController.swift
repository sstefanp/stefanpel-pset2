//
//  WordViewController.swift
//  Mad Libs
//
//  Created by Stefan Pel on 17-02-17.
//  Copyright © 2017 Stefan Pel. All rights reserved.
//

import UIKit
import Foundation

class WordViewController: UIViewController {
    
    // variables
    var contents: String?
    var storyNew = Story(stream: "")
    var countPlaceholder: Int?
    var remainingWords: Int?
    var nextPlaceholderType: String?
    var text: String?
    
    // Outlets
    @IBOutlet weak var newStoryButton: UIButton!
    @IBOutlet weak var wordsLeftField: UILabel!
    @IBOutlet weak var wordsInputField: UITextField!
    @IBOutlet weak var nextWordButton: UIButton!
    @IBOutlet weak var upperLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide to-story-button untill all words have been filled in
        newStoryButton.isHidden = true
        
        // randomly choose new story
        let array = ["/madlib0_simple", "/madlib1_tarzan", "/madlib2_university", "/madlib3_clothes", "/madlib4_dance"]
        let random = Int(arc4random_uniform(UInt32(array.count)))
        guard let contents = try? String(contentsOfFile: Bundle.main.path(forResource: "\(array[random])", ofType: "txt")!) else {
            return
        }
        
        // set story
        storyNew = Story(stream: contents)
        
        // update count field with first placeholder
        countPlaceholder = storyNew.getPlaceholderRemainingCount()
        wordsLeftField.text = "\(String(describing: countPlaceholder!)) word(s) left"
        
        // update text field with first placeholder
        nextPlaceholderType = storyNew.getNextPlaceholder()
        wordsInputField.placeholder = "Fill in a(n) \(nextPlaceholderType!)"
    }
    @IBAction func nextWordButton(_ sender: Any) {
        // if last word change button
        if countPlaceholder == 1 {
            nextWordButton.setTitle("Finish", for: .normal)
        }
        // if text-box is empty, ask nicely
        if wordsInputField.text!.isEmpty {
            wordsInputField.placeholder = "Please fill in a(n) \(nextPlaceholderType!)"
        }

        // one or more words remaining
        else {
            nextWordButton.isHidden = false
            
            if countPlaceholder! >= 1 {
                
                // update count
                countPlaceholder = countPlaceholder! - 1
                wordsLeftField.text = "\(String(describing: countPlaceholder!)) word(s) left"
                
                // add word to story
                storyNew.fillInPlaceholder(word: wordsInputField.text!)
                
                // prepare for next word
                nextPlaceholderType = storyNew.getNextPlaceholder()
                wordsInputField.text?.removeAll()
                
                // if all the words are filled in
                if countPlaceholder == 0 {
                    // disable textfield and change label
                    upperLabel.text = "Jay! All the words are filled in!"
                    wordsInputField.isHidden = true
                    nextWordButton.isHidden = true
                    wordsLeftField.isHidden = true
                    newStoryButton.isHidden = false
                }
                else {
                    // update placeholder
                    wordsInputField.placeholder = "Fill in a(n) \(nextPlaceholderType!)"
                }
            }
        }
    }
    @IBAction func newStoryButton(_ sender: Any) {
        text = storyNew.toString()
    }
    
    // sending text to TextViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let textVC = segue.destination as? TextViewController {
            textVC.text = text
        }
    }
}
