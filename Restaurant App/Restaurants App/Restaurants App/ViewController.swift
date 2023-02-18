//
//  ViewController.swift
//  Restaurants App
//
//  Created by evian Zhao on 2/13/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let resturants = ["ALTURA","Rapport Seattle", "Carrello", "The Pink Door", "Lionhead"]
    
    let food = [["KONA KANPACHI","TOMATO VARIATION", "SOCKEYE SALMON","TORTELLONI","AFFOGATO"],["Latte","Braised Greens Tartine", "Rapport Salsd", "Avocado Toast", "Vegetable Hash"],["Squid Ink Chittara","Cannoli", "Gnocchi","Potato Agnolotti"],["Lasagna Pink Door","Winter Risotto", "Seafood", "Arancini","Ahi Tuna Crudo"],["Pork Dumplings in Chili Sauce","Dan Dan Mian", "Gung Bao Chicken", "Mushroom Mapo Doufu"]]

    let restaurantCellReuseIdentifier = "RestaurantCell"
    let foodItemCellReuseIdentifier = "FoodItemCell"
    
    @IBOutlet weak var tblViewTop: UITableView!
    
    @IBOutlet weak var tblViewBottom: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblViewBottom.register(UITableViewCell.self, forCellReuseIdentifier: "FoodItemCell")
        
        tblViewTop.delegate = self
        tblViewTop.dataSource = self
        
        tblViewBottom.delegate = self
        tblViewBottom.dataSource = self
        
        let initialIndexPath = IndexPath(row :0, section: 0)
        tblViewTop.selectRow(at: initialIndexPath, animated: false, scrollPosition: .none)
        
        tableView(tblViewTop, didSelectRowAt: initialIndexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblViewTop {
            tblViewBottom.reloadData()
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewTop {
                    return resturants.count
                } else {
                    let selectedRow = tblViewTop.indexPathForSelectedRow?.row ?? 0
                    return food[selectedRow].count
                }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tblViewTop {
            let topcell = tableView.dequeueReusableCell(withIdentifier: restaurantCellReuseIdentifier, for: indexPath)
            topcell.textLabel?.text = resturants[indexPath.row]
            return topcell
            
        }else{
            let
            bottomcell = tableView.dequeueReusableCell(withIdentifier: foodItemCellReuseIdentifier, for: indexPath)
                        let selectedRow = tblViewTop.indexPathForSelectedRow?.row ?? 0
            bottomcell.textLabel?.text = food[selectedRow][indexPath.row]
                        return bottomcell

        }
        
        
    }
    
    


}

