//
//  ViewController.swift
//  midTermProject
//
//  Created by E Z on 3/18/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //var rows = IndexPath()
    var imageIndex = 0
    let arr = ["The Colosseum", "The Great Wall of China", "The Taj Mahal", "Christ the Redeemer", "Machu Picchu", "Chichén Itzá", "Petra"]
    
    var details = ["The Colosseum", "The Great Wall of China", "The Taj Mahal", "Christ the Redeemer", "Machu Picchu", "Chichén Itzá", "Petra"]
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        
        cell.imageContainer.image = UIImage(named: arr[indexPath.row])
        cell.lblImage.text = arr[indexPath.row]
        return cell
    }
    
    //var index = 0
    
//    @IBAction func gotoSeondVC(_ sender: Any) {//button
//        performSegue(withIdentifier: "segueSecondVC", sender: self)
//        //xian indentifier
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "segueSecondVC", sender: self)
        //index = indexPath.row
        let imageClicked = arr[indexPath.row]
        imageIndex = indexPath.row
        print(imageClicked)
                
        performSegue(withIdentifier: "segueSecondVC", sender: "self")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueSecondVC"{
            let secondVC = segue.destination as! DetailsViewController
            secondVC.index = imageIndex
        }
    }

}

