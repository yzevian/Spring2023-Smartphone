//
//  ViewController.swift
//  Hello World1
//
//  Created by evian Zhao on 1/21/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblExample: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("I am inside viewDidLoad() function")
    }

    @IBAction func pressMeAction(_ sender: UIButton) {
        print("Button was Pressed")
        lblExample.text = "Hello World"
    }
    
}

