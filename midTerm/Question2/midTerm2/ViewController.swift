//
//  ViewController.swift
//  midTerm2
//
//  Created by E Z on 3/18/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController {

    
    @IBOutlet weak var tblSymbol: UITextField!
    
    @IBOutlet weak var lblCompany: UILabel!
    
    
    @IBOutlet weak var lblPrice: UILabel!
    
    
    @IBOutlet weak var lblWebsite: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchAction(_ sender: Any) {
        
        guard let symbol = tblSymbol.text else {return}
        let url = "\(baseURL)\(symbol)?apikey=\(apiKey)"
        //print("URL = \(url)")
        
        SwiftSpinner.show("Getting Stock prce for \(symbol)")
        
        AF.request(url).responseJSON{ response in
            SwiftSpinner.hide()
            if response.error != nil {
                print("Error")
                return
            }
            
           // print(response.data)
            guard let rawData = response.data else {return}
            guard let jsonArray  = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}
           // print(stock)
            
            let companyName = stock["companyName"].stringValue
            let price = stock["price"].stringValue
            let website = stock["website"].stringValue
            
            self.lblCompany.text = companyName
            self.lblPrice.text = price
            self.lblWebsite.text = website
            
//            print("Symbol = \(symbol)")
//            print("Price = \(price)")
//            print("Volume = \(volume )")
//
            //self.txtStockPrice.text = "Price = \(price) $"
            
        }
        
    }
    
   
    
    
}

