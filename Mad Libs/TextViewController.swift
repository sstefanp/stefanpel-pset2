//
//  TextViewController.swift
//  Mad Libs
//
//  Created by Stefan Pel on 20-02-17.
//  Copyright © 2017 Stefan Pel. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    // receiving text from WordViewController
    var text: String?
    
    @IBOutlet weak var storyView: UITextView!
    
    // present text to user
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyView.text = text
    }
    
    // creating new story, clearing text
    @IBAction func createNewStory(_ sender: Any) {
        text = ""
    }
    
}
