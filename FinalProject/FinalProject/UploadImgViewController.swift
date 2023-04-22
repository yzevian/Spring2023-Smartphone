//
//  UploadImgViewController.swift
//  FinalProject
//
//  Created by E Z on 4/22/23.
//

import UIKit
import CoreLocation
import RealmSwift

class UploadImgViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    let realm = try! Realm()

    var uploadProtocol : UploadImageProtocol?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        // Do any additional setup after loading the view.
    }

    
    @IBAction func getLatLongAction(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location  = locations.last else {return}
        
        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        
        getAddressFromLocation(location: location)
        //47.62068706185353, -122.34922375953582
    }
    
    func getAddressFromLocation(location:CLLocation){
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location){ placemarks, error in
            if error != nil{
                print(error as Any)
                return
            }
            
            var address = ""
            guard let place = placemarks?.first else{return}
            if place.name != nil{
                address += place.name! + ", "
            }
            if place.locality != nil{
                address += place.locality! + ", "
            }
            if place.subLocality != nil{
                address += place.subLocality! + ", "
            }
            if place.country != nil{
                address += place.country! + ", "
            }
            if place.postalCode != nil{
                address += place.postalCode! + ", "
            }
            
            //print(address)
            self.lblLocation.text = "\(address)"
        }
    }
    
    @IBAction func uploadAction(_ sender: Any) {
        guard let img = imgView.image else {return}
        guard let location = lblLocation.text else {return}
        guard let title = txtTitle.text else {return}
        
        guard let img = imgView.image else {return}
        guard let location = lblLocation.text else {return}
        guard let title = txtTitle.text else {return}
                
        let imageData: Data? = img.pngData()
                
        let imgData: PicInfo = PicInfo()
        imgData.title = title
        imgData.location = location
        imgData.Image = imageData
               
                // Add to the Realm
                do {
                    try realm.write {
                        realm.add(imgData, update: .modified)
                    }
                } catch let error as NSError {
                    print("Unable to add values to the DB " + error.localizedDescription)
                }
        
        uploadProtocol?.uploadedImageDelegate(img: img, locationImg: location, titleImg: title)
        self.tabBarController?.selectedIndex = 0
        
    }
    
    @IBAction func takeAPicAction(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Take a Picture", message: "Something", preferredStyle: .alert)
        locationManager.requestLocation()
        let cameraAction = UIAlertAction(title: "Camera", style: .default){ action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera;
                imagePicker.allowsEditing  = false
                self.present(imagePicker, animated:true)
            }
            
        }
        
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default){ action in
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let imagePicker = UIImagePickerController()
                
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary;
                imagePicker.allowsEditing  = false
                self.present(imagePicker, animated:true)
            }
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel){ action in
            print("Cancel")
        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            imgView.image = image
        }
        
        picker.dismiss(animated: true)
    }
    
}
