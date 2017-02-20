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
    
    // Story
    var story: Story!
    var text: String?
    
    // variables
    var contents: String?
    var storyNew = Story(stream: "")
    var countPlaceholder: Int?
    var remainingWords: Int?
    var nextPlaceholderType: String?
    
    // Outlets
    
    @IBOutlet weak var newStoryButton: UIButton!
    @IBOutlet weak var wordsLeftField: UILabel!
    @IBOutlet weak var wordsInputField: UITextField!
    @IBOutlet weak var nextWordButton: UIButton!
    
    // changing label to "all the words are filled in"
    @IBOutlet weak var upperLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide to story button untill all words have been filled in
        newStoryButton.isHidden = true
        
        // hide continue button unless word is filled in
        //nextWordButton.isHidden = true
        
        // get new story
        let array = ["/madlib0_simple", "/madlib1_tarzan", "/madlib2_university", "/madlib3_clothes", "/madlib4_dance"]
        let random = Int(arc4random_uniform(UInt32(array.count)))
        let contents = try! String(contentsOfFile: Bundle.main.path(forResource: "\(array[random])", ofType: "txt")!)
        storyNew = Story(stream: contents)
        
        // set story
        storyNew = Story(stream: contents)
        print(contents)
        
        // update fields
        countPlaceholder = storyNew.getPlaceholderRemainingCount()
        print(countPlaceholder! as Int)
        wordsLeftField.text = "\(String(describing: countPlaceholder!)) word(s) left"
        nextPlaceholderType = storyNew.getNextPlaceholder()
        wordsInputField.placeholder = "Fill in a(n) \(nextPlaceholderType!)"
    }
    @IBAction func nextWordButton(_ sender: Any) {
        if countPlaceholder == 1 {
            newStoryButton.isHidden = false
            nextWordButton.isEnabled = false
        }
        if wordsInputField.text!.isEmpty {
            wordsInputField.placeholder = "Please fill in a(n) \(nextPlaceholderType!)"
        }

        else {
            nextWordButton.isHidden = false
            
            if countPlaceholder! >= 1 {
                countPlaceholder = countPlaceholder! - 1
                wordsLeftField.text = "\(String(describing: countPlaceholder!)) word(s) left"
                
                // add word to story
                storyNew.fillInPlaceholder(word: wordsInputField.text!)
                print (wordsInputField.text!)
                
                // prepare for next word
                nextPlaceholderType = storyNew.getNextPlaceholder()
                wordsInputField.text?.removeAll()
                
                // if all the words are filled in
                if countPlaceholder == 0 {
                    // disable textfield
                    upperLabel.text = "Jay! All the words are filled in!"
                    wordsInputField.isHidden = true
                    nextWordButton.isHidden = true
                    wordsLeftField.isHidden = true
                }
                else {
                  wordsInputField.placeholder = "Fill in a(n) \(nextPlaceholderType!)"
                }
            }
        }
    }
    @IBAction func newStoryButton(_ sender: Any) {
        text = storyNew.toString()
        print(text!)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let textVC = segue.destination as? TextViewController {
            textVC.text = text
        }
    }
}
