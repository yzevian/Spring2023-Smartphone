//
//  DetailsViewController.swift
//  midTermProject
//
//  Created by E Z on 3/18/23.
//

import UIKit

class DetailsViewController: UIViewController {

    var index = 0
    var details = ["The Colosseum", "The Great Wall of China", "The Taj Mahal", "Christ the Redeemer", "Machu Picchu", "Chichén Itzá", "Petra"]
    
    @IBOutlet weak var lblTxt: UITextView!
    
    @IBOutlet weak var lbllable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTxt.text = details[index]
    }
    


}
