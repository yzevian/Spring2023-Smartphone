//
//  TabBarViewController.swift
//  FinalProject
//
//  Created by E Z on 4/22/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = viewControllers?[0] as! HomeViewController
        let uploadPicVC = viewControllers?[1] as! UploadImgViewController
        uploadPicVC.uploadProtocol = homeViewController.self
        // Do any additional setup after loading the view.
    }
    

}
