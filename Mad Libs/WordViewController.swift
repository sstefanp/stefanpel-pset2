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
    
    // variables
    var contents: String?
    var storyNew = Story(stream: "")
    var countPlaceholder: Int?
    
    // Outlets
    @IBOutlet weak var newStoryButton: UIButton!
    @IBOutlet weak var wordsLeftField: UILabel!
    @IBOutlet weak var wordsInputField: UITextField!
    @IBOutlet weak var nextWordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide button untill all words have been filled in
        newStoryButton.isHidden = true
        
        // get new story
        let array = ["/madlib0_simple", "/madlib1_tarzan", "/madlib2_university", "/madlib3_clothes", "/madlib4_dance"]
        let random = Int(arc4random_uniform(UInt32(array.count)))
        let contents = try! String(contentsOfFile: Bundle.main.path(forResource: "\(array[random])", ofType: "txt")!)
        storyNew = Story(stream: contents)
        
        // set story
        storyNew = Story(stream: contents)
        print(contents)
    }
}
    
    
        //let randomIndex = Int(arc4random_uniform(UInt32(texts.count)))
        // randomIndex picking from texts

    // Variables
        // stories to be chosen randomly
        // placeholder for textField
    

    
    
    // Outlets

    
    // Actions
    //@IBAction func nextWordButton(_ sender: UIButton) {
        //
    //}
