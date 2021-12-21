//
//  Lawerrrrrrr.swift
//  Fawaz solo project
//
//  Created by Fawaz on 12/12/2021.
//

import UIKit
//--------------------------------------------------------------------------
struct Lawyer {
  let id: String
  let name: String
  let image: String
  let latitude: Double
  let longitude: Double

  var dictLawyer: [String: Any] {
    return [
      "name": name,
      "id": id,
      "latitude" : latitude,
      "longitude" : longitude
    ]
  }
}
//--------------------------------------------------------------------------
