//
//  2.swift
//  Fawaz solo project
//
//  Created by Fawaz on 16/12/2021.
//

import Foundation
import CoreLocation
import MessageKit

struct LocationMKit: LocationItem{
    var location: CLLocation
    var size: CGSize
}

struct UserAnnotation: Decodable {
  var name: String
  var email: String
  var image: Data
  var location: Location
}

struct Location: Codable {
    var long: String
    var lat: String
}


