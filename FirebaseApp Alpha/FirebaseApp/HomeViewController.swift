//
//  HomeViewController.swift
//  MOTM Alpha
//
//  Created by Roman Lab on 01.12.2018.
//  Copyright © 2018 Roman_Lab. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class HomeViewController:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleLogout(_ sender:Any) {
        try! Auth.auth().signOut()
        self.dismiss(animated: false, completion: nil)
    }
}
