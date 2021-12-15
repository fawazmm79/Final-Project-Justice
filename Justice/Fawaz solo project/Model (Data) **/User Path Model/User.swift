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
  let name: String
  let image: String
  let latitude: Double
  let longitude: Double

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
