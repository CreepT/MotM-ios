//
//  MapDetailViewController.swift
//  FirebaseApp
//
//  Created by Roman Lab on 01.12.2018.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import UIKit

class MapDetailViewController: UIViewController {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var subText: UILabel!
    @IBOutlet weak var coordinateText: UILabel!
    
    var titlee = ""
    var subtitle = ""
    var latitud = 0.0
    var longitud = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = titlee
        subText.text = subtitle
        coordinateText.text = String(format: "Lat: %.6f // Lon: %.6f",latitud,longitud)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
