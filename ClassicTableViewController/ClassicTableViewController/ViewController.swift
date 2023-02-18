//
//  ViewController.swift
//  ClassicTableViewController
//
//  Created by evian Zhao on 2/17/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   

    let friends = ["A", "B", "C", "D", "E", "F"]
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath)
        
        cell.textLabel?.text = friends[indexPath.row]
        
        return cell
    }
    
    
    

}

