//
//  MapVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit
import CoreLocation
import MapKit

class MapVC: UIViewController {
  
  //-------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureLocationManager()
    configureMapView()
    enableLocationServices()
  }
  //-------------------------------------------------------------------------
  var locationManager: CLLocationManager!
  var mapView: MKMapView!
  //-------------------------------------------------------------------------
  let centerMapButton: UIButton = {
    
    let button = UIButton()
    button.tintColor = .white
    button.backgroundColor = .systemBlue
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(UIImage(systemName: "location.fill"), for: .normal)
    button.addTarget(self, action: #selector(handleCenterLocation), for: .touchUpInside)
    return button
  }()
  //-------------------------------------------------------------------------
  @objc func handleCenterLocation() {
    centerMapOnUserLocation()
  }
  //-------------------------------------------------------------------------
  func configureLocationManager() {
    locationManager = CLLocationManager()
    locationManager.delegate = self
  }
  //-------------------------------------------------------------------------
  func configureMapView() {
    
    mapView = MKMapView()
    mapView.showsUserLocation = true
    mapView.delegate = self
    mapView.userTrackingMode = .follow
    
    view.addSubview(mapView)
    mapView.frame = view.frame
    
    centerMapButton.layer.cornerRadius = 70 / 2
    view.addSubview(centerMapButton)
    NSLayoutConstraint.activate([
      centerMapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 135),
      centerMapButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 270),
      centerMapButton.widthAnchor.constraint(equalToConstant: 70),
      centerMapButton.heightAnchor.constraint(equalToConstant: 70),
    ])
    //-----------------------------------------------------------------------
    let m1 = MKPointAnnotation()
    m1.title = "?????????????? ???????????????? ??????????"
    m1.coordinate = CLLocationCoordinate2D(latitude: 18.2171787,
                                           longitude: 42.5145483)
    mapView.addAnnotation(m1)
    //-----------------------------------------------------------------------
    let m2 = MKPointAnnotation()
    m2.title = "?????????? ?????????????????? ???????????????? ???????????? ????????"
    m2.coordinate = CLLocationCoordinate2D(latitude: 18.2701924,
                                           longitude: 42.4997155)
    mapView.addAnnotation(m2)
    //-----------------------------------------------------------------------
    let m3 = MKPointAnnotation()
    m3.title = "?????????? ?????????????? ??????????"
    m3.coordinate = CLLocationCoordinate2D(latitude: 18.238223,
                                           longitude: 43.13856)
    mapView.addAnnotation(m3)
    //-----------------------------------------------------------------------
    let m4 = MKPointAnnotation()
    m4.title = "?????????????? ???????????????? ??????????"
    m4.coordinate = CLLocationCoordinate2D(latitude: 18.2170005,
                                           longitude: 42.5144520)
    mapView.addAnnotation(m4)
    //-----------------------------------------------------------------------
    let m5 = MKPointAnnotation()
    m5.title = "?????????? ???????????????? ???????????????? ???????????? ????????"
    m5.coordinate = CLLocationCoordinate2D(latitude: 18.2174074,
                                           longitude: 42.5129044)
    mapView.addAnnotation(m5)
    //-----------------------------------------------------------------------
    let m6 = MKPointAnnotation()
    m6.title = "?????????????? ???????????????? ??????????"
    m6.coordinate = CLLocationCoordinate2D(latitude: 18.2445697,
                                           longitude: 42.6352728)
    mapView.addAnnotation(m6)
    //-----------------------------------------------------------------------
    let m7 = MKPointAnnotation()
    m7.title = "?????????? ?????????????????? ???????????? ????????"
    m7.coordinate = CLLocationCoordinate2D(latitude: 18.2464765,
                                           longitude: 42.6347420)
    mapView.addAnnotation(m7)
    //-----------------------------------------------------------------------
    let m8 = MKPointAnnotation()
    m8.title = "?????????? ??????????????"
    m8.coordinate = CLLocationCoordinate2D(latitude: 18.3202417,
                                           longitude: 42.6964195)
    mapView.addAnnotation(m8)
    //-----------------------------------------------------------------------
    let m9 = MKPointAnnotation()
    m9.title = "?????????????? ???????????? ?????????? ????????"
    m9.coordinate = CLLocationCoordinate2D(latitude: 18.3234398,
                                           longitude: 42.6954160)
    mapView.addAnnotation(m9)
  }
  //-------------------------------------------------------------------------
  
  func centerMapOnUserLocation() {
    guard let coordinate = locationManager.location?.coordinate else { return }
    let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
    mapView.setRegion(region, animated: true)
  }
}
//-------------------------------------------------------------------------
extension MapVC: MKMapViewDelegate {
  
  func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
    UIView.animate(withDuration: 0.5) {
      self.centerMapButton.alpha = 1
    }
  }
}
//-------------------------------------------------------------------------
extension MapVC: CLLocationManagerDelegate {
  
  func enableLocationServices() {
    
    switch CLLocationManager.authorizationStatus() {
      
    case .notDetermined:
      print("Location auth status is NOT DETERMINED")
      locationManager.requestWhenInUseAuthorization()
      
    case .restricted:
      print("Location auth status is RESTRICTED")
      
    case .denied:
      print("Location auth status is DENIED")
      
    case .authorizedAlways:
      print("Location auth status is AUTHORIZED ALWAYS")
      
    case .authorizedWhenInUse:
      print("Location auth status is AUTHORIZED WHEN IN USE")
      locationManager.startUpdatingLocation()
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
  }
  //-------------------------------------------------------------------------
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    guard locationManager.location != nil else { return }
    centerMapOnUserLocation()
  }
}
//-------------------------------------------------------------------------
