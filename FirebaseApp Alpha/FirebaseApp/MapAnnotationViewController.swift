//
//  MapAnnotationViewController.swift
//  FirebaseApp
//
//  Created by Roman Lab on 01.12.2018.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import UIKit
import MapKit

class MapAnnotationViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locManager = CLLocationManager()
    var coor = CLLocationCoordinate2D()

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        locManager.delegate = self
        locManager.requestWhenInUseAuthorization()
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        
        guard let newCoords = locManager.location?.coordinate else {return}
        
        let region = MKCoordinateRegionMakeWithDistance(newCoords, 500, 500)
        mapView.setRegion(region, animated: true)
        
        coor = newCoords
        
        let annotation1 = MKPointAnnotation()
        annotation1.title = "Привет"
        annotation1.subtitle = "Это вкусный ресторан!"
        annotation1.coordinate = coor
        mapView.addAnnotation(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.title = "Прекрастный вид"
        annotation2.subtitle = "Я приду седа еще раз!"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.331595, longitude: -122.031993)
        mapView.addAnnotation(annotation2)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil
        }
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.canShowCallout = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        
        return pin
    }
/*
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let annView = view.annotation
        let storyBoard = UIStoryboard(name: "Mail", bundle: nil)
     //   let ditaileVC = storyBoard.instantiateViewController(withIdentifier: "Detail") as! MapDetailViewController
        
        ditaileVC.title = ((annView?.title!)!)
         ditaileVC.subtitle = ((annView?.subtitle!)!)
        ditaileVC.latitud = ((annView?.coordinate.latitude)!)
        ditaileVC.longitud = ((annView?.coordinate.longitude)!)
        
        self.navigationController?.pushViewController(ditaileVC, animated: true)
        
    }
 */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
