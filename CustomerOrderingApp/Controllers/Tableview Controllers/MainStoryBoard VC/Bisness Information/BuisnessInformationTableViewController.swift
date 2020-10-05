//
//  BuisnessInformationTableViewController.swift
//  CustomerOrderingApp
//
//  Created by M.Danish Arslan Munir on 28/09/2020.
//  Copyright © 2020 Danish Munir. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
class BuisnessInformationTableViewController:
    UITableViewController , CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!
    var locManager = CLLocationManager()
    
    var lat : CLLocationDegrees?
    var lng : CLLocationDegrees?
    
    //MARK:- LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.requestWhenInUseAuthorization()
        //        getCurretntLoc()
        locManager.delegate = self
        locManager.startUpdatingLocation()
        
        
        tableView.tableHeaderView?.backgroundColor = .clear
        perpareNavigation(txtTitle: "Buisness information", leftImage: UIImage(named: "Back"), rightImage: nil)
        
        
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





extension BuisnessInformationTableViewController {
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return .leastNormalMagnitude
        }
        return 50
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let headerView: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        headerView.textLabel?.font = UIFont(name: "Helvetica Neue", size: 15)
        let myView = UIView()
        myView.backgroundColor = UIColor(named: "F8F8FA")
        
        headerView.backgroundView = myView
        
        if section == 1 {
            headerView.textLabel?.text = "Contact business"
        } else if section == 2 {
            headerView.textLabel?.text = "Buisness Notes"
        } else if section == 3 {
            headerView.textLabel?.text = "Buisness Hours"
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}

