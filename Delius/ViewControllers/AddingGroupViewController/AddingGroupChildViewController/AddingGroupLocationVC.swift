//
//  AddingGroupLocationVC.swift
//  Delius
//
//  Created by 박진호 on 2020/06/14.
//  Copyright © 2020 정윤환. All rights reserved.
//
protocol ProtocolAddingGroupLocation{
    func completeLocation(obj:[String:Any])
}
import UIKit
import MapKit
import CoreLocation
class AddingGroupLocationVC:UIViewController,CLLocationManagerDelegate{
    var contentView:AddingGroupLocationView!
    var delegate:CreateGroupLocaionDelegate?=nil
    var tap:UITapGestureRecognizer!
    
    var lo1:Double?
    var lo2:Double?
    var lo:String?
    
    var isbtnOpen:Bool = false
    
    let locationManager = CLLocationManager()
    var mapView:MKMapView={
        let v = MKMapView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        tap = UITapGestureRecognizer()
        mapView.addGestureRecognizer(tap)
        tap.addTarget(self, action: #selector(mapTap(_:)))

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        
        
        setup()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        contentView.openAnimation()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(false)
        self.dismiss(animated: false, completion: {})
    }
    private func setup(){
        contentView = AddingGroupLocationView(frame: view.bounds)
        self.view.addSubview(contentView)
        contentView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.saveBtn.addTarget(self, action: #selector(completeBtnFunc(_:)), for: .touchUpInside)
        
        contentView.contentView.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: contentView.subNameLabel.bottomAnchor,constant: 10).isActive = true
        mapView.leftAnchor.constraint(equalTo: contentView.contentView.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: contentView.contentView.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: contentView.contentView.bottomAnchor).isActive = true
        
        contentView.contentView.sendSubviewToBack(mapView)
        
    }
    private func checkLocationData(completion:@escaping(String,Double,Double)->Void){
        if self.lo == nil || self.lo1 == nil || self.lo2 == nil {
            ShowAlert.OnlyDefault(vc: self, title: "", message: "장소를 선택해주세요.")
            return
        }
        let localName = self.lo!
        let latitude = self.lo1!
        let longitude = self.lo2!
        completion(localName,latitude,longitude)
    }
    @objc func completeBtnFunc(_ sender:UIButton){
        checkLocationData { (localName, latitude, longitude) in
            self.delegate?.transfer(lo1: latitude, lo2: longitude, lo: localName)
        }
    }
    let regionRadius: CLLocationDistance = 1500
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
      mapView.setRegion(coordinateRegion, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let coordinateRegion = MKCoordinateRegion(center: center,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)

        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location!, completionHandler: {(placemarks, error)->Void in
            if error != nil{
            }
            print(placemarks![0].locality!)
//            self.localNameLabel.text = placemarks![0].locality! + " " + placemarks![0].subLocality!
        })
        self.mapView.setRegion(coordinateRegion, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }

    
    private func locationManager(manager: CLLocationManager, didFailWithError error: NSError){
        print("Error: " + error.localizedDescription, terminator: "")
    }

    func addAnnotation(location: CLLocationCoordinate2D){
        let annotations = self.mapView.annotations
        self.mapView.removeAnnotations(annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        self.mapView.addAnnotation(annotation)
    }
    @objc func mapTap(_ sender:UITapGestureRecognizer){
        
        if !self.isbtnOpen{
            contentView.appearSaveBtn()
            self.isbtnOpen = true
        }
        
        let locationInView = sender.location(in: mapView)
        let locationOnMap = mapView.convert(locationInView, toCoordinateFrom: mapView)
        
        addAnnotation(location:locationOnMap )
        let clLocation = CLLocation(latitude: locationOnMap.latitude, longitude: locationOnMap.longitude)
        let region = MKCoordinateRegion(center: locationOnMap, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(region, animated: true)
        updateLabel(location: clLocation)
    }
    private func updateLabel(location:CLLocation){
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error)->Void in
            if error != nil{
                
            }
            self.lo1 = location.coordinate.latitude
            self.lo2 = location.coordinate.longitude
            print(placemarks![0].locality!)
            guard let placeMark = placemarks?[0] else { return }
            if let sub = placeMark.subLocality{
                self.lo = placeMark.locality! + sub
//                contentView.localNameLabel.text = placemarks![0].locality! + sub
            }else{
                self.lo = placeMark.locality!
//                contentView.localNameLabel.text = placemarks![0].locality!
            }
        })
    }
}

extension AddingGroupLocationVC: MKMapViewDelegate{

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { print("no mkpointannotaions"); return nil }

//        let reuseId = "pin"
//        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
//        pinView?.image! = UIImage(named: "maincell3")!
//        //pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//        pinView!.canShowCallout = true
//
//        return pinView
        let Identifier = "Pin"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: Identifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: Identifier)
            annotationView?.canShowCallout = true

            // Resize image
            let pinImage = UIImage(named: "Pin")
            let size = CGSize(width: 132, height: 110)
            UIGraphicsBeginImageContext(size)
            pinImage!.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()

            annotationView?.image = resizedImage
        }
        else {
            annotationView?.annotation = annotation
        }
        return annotationView
        
        
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        print("tapped on pin")
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            if let doSomething = view.annotation?.title! {
               print("do something")
            }
            
        }
        
    }
    
}

    
