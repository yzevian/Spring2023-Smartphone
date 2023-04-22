//
//  HomeViewController.swift
//  FinalProject
//
//  Created by E Z on 4/22/23.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UploadImageProtocol {
    

    var images : [UIImage] = [UIImage]()
    var location = [String]()
    var imageTitle : [String] = [String]()
    
    let realm = try! Realm()
    
    @IBOutlet weak var tblView: UITableView!
    
    var uploadImageVC : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(Realm.Configuration.defaultConfiguration.fileURL!)
        let controller = navigationController?.tabBarController
        uploadImageVC = navigationController?.tabBarController?.viewControllers?[0]
        print(uploadImageVC?.title)

        getValues()
        // Do any additional setup after loading the view.
    }
    
    func getValues(){
        do{
            let pic = realm.objects(PicInfo.self)
            print(pic)
        }
        catch let error as NSError {
            // Handle error
            print("Error")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self)?.first as! TableViewCell
        cell.imageContainer.image = images[indexPath.row]
        cell.lblImage?.text = imageTitle[indexPath.row]
        cell.lblLocation?.text = location[indexPath.row]
        return cell
    }
    
    func uploadedImageDelegate(img: UIImage, locationImg: String, titleImg: String) {
        images.append(img)
        location.append(locationImg)
        imageTitle.append(titleImg)
        
        tblView.reloadData()
    }
    

}
