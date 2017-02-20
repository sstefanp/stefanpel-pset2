//
//  TextViewController.swift
//  Mad Libs
//
//  Created by Stefan Pel on 20-02-17.
//  Copyright © 2017 Stefan Pel. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    
    //
    
    var text: String?
    
    @IBOutlet weak var storyView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storyView.text = text
    }
}
