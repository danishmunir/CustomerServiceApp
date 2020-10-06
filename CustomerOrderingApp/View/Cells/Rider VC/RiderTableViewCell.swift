//
//  RiderTableViewCell.swift
//  CustomerOrderingApp
//
//  Created by Danish Munir on 06/10/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class RiderTableViewCell: UITableViewCell, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var profileImageView: UIImageView!
    var locManager = CLLocationManager()
    var lat : CLLocationDegrees?
    var lng : CLLocationDegrees?
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.roundedImage(image: profileImageView)
//        locManager.requestWhenInUseAuthorization()
//
        locManager.delegate = self
//        locManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            guard let currentLocation = locManager.location else {
                return
            }
            
            lat =  currentLocation.coordinate.latitude
            lng = currentLocation.coordinate.longitude
            mapView.isHidden = false
            showMapView()
            
        }
    }
    
    
    func showMapView() {
        
        guard let lat = lat else {
            return
        }
        guard let lng = lng else {
            return
        }
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lng, zoom: 14.0)
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        marker.title = ""
        marker.snippet = "Lahore"
        marker.map = mapView
        mapView.camera = camera
    }
    
}
