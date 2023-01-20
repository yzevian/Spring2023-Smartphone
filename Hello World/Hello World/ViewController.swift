//
//  ViewController.swift
//  Hello World
//
//  Created by apple on 1/20/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblExample: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("I am inside viewDidLoad() function")
        
    }

    @IBAction func PressMeAction(_ sender: UIButton) {
        print("Button was Pressd")
        lblExample.text = "Button was Pressd"
    }
    
}

