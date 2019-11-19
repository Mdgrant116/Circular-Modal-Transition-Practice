//
//  SecondViewController.swift
//  Circular Modal Transition Practice
//
//  Created by Michael Grant on 11/19/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func hideTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
