//
//  ViewController.swift
//  Circular Modal Transition Practice
//
//  Created by Michael Grant on 11/19/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {



    @IBOutlet var startButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        startButton.layer.cornerRadius = 60 / 2
    }
    
    @IBAction func showNewVC(_ sender: Any) {
        
        
        
    }
    

}

