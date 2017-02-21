//
//  ViewController.swift
//  Mad Libs
//
//  Created by Stefan Pel on 17-02-17.
//  Copyright © 2017 Stefan Pel. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var lowerView: UIView!
    @IBOutlet weak var logoView: UIImageView!
    
    
    override func viewWillLayoutSubviews() {
        // app is in landscape view
        if self.view.bounds.width > self.view.bounds.height {
            // text + button
            self.lowerView.frame.size.width = 0.5 * self.view.bounds.width
            self.lowerView.frame.origin.x = 0.5 * self.view.bounds.width
            self.lowerView.frame.origin.y = 64
            self.lowerView.frame.size.height = self.view.bounds.height
            // logo
            self.logoView.frame.origin.x = 0
            self.logoView.frame.origin.y = 64
            self.logoView.frame.size.width = 0.5 * self.view.bounds.width
            self.logoView.frame.size.height = self.view.bounds.height - 64
        }
        
        // app is in portret view
        else {
            // text + button
            self.lowerView.frame.size.height = 0.5 * self.view.bounds.height
            self.lowerView.frame.origin.x = 0
            self.lowerView.frame.origin.y = 0.5 * self.view.bounds.height
            self.lowerView.frame.size.width = self.view.bounds.width
            // logo
            self.logoView.frame.origin.x = 0
            self.logoView.frame.origin.y = 44
            self.logoView.frame.size.height = 0.5 * self.view.bounds.height - 44
            self.logoView.frame.size.width = self.view.bounds.width
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
