//
//  MapViewController.swift
//  FirebaseApp
//
//  Created by Roman Lab on 01.12.2018.
//  Copyright © 2018 Robert Canton. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchBarDelegate {

    private let locationManager = CLLocationManager()
    private var currentCoordinate: CLLocationCoordinate2D?
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet var searchView: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView.delegate = self
         configureLocationServices()
    }
    
    
    @IBAction func tapToHideKey(_ sender: Any) {
        searchView.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(searchView.text!) { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil{
                let placemark = placemarks?.first
                let anno = MKPointAnnotation()
                anno.coordinate = (placemark?.location?.coordinate)!
                anno.title = self.searchView.text!
                
                let span = MKCoordinateSpanMake(0.075, 0.075)
                let region = MKCoordinateRegion(center: anno.coordinate, span: span)
                
                self.mapView.setRegion(region, animated: true)
                self.mapView.addAnnotation(anno)
                self.mapView.selectAnnotation(anno, animated: true)
            } else{
                print("Ошибка: \(error?.localizedDescription)")
            }
        }
    }
    
    private func configureLocationServices() {
        locationManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        if status == .notDetermined {
            locationManager.requestAlwaysAuthorization()
        } else if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: locationManager)
        }
    }
    
    private func beginLocationUpdates(locationManager: CLLocationManager) {
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
        let zoomRegion = MKCoordinateRegionMakeWithDistance(coordinate, 10000, 10000)
        mapView.setRegion(zoomRegion, animated: true)
    }

}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Did get latest location")
        
        guard let latestLocation = locations.first else { return }
        
        if currentCoordinate == nil {
            zoomToLatestLocation(with: latestLocation.coordinate)
        }
        
        currentCoordinate = latestLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("The status changed")
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            beginLocationUpdates(locationManager: manager)
        }
    }
}
