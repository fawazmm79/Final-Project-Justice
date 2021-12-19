//
//  User.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit
import MapKit
//--------------------------------------------------------------------------
struct User {
  let id: String
  var name: String
  var image: String
  var userEmail: String
  var status: String
  var latitude: Double
  var longitude: Double
  
  var dict: [String: Any] {
    return [
      "name": name,
      "id": id,
      "latitude" : latitude,
      "longitude" : longitude
    ]
  }
}
//--------------------------------------------------------------------------
