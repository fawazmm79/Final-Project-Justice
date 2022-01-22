//
//  s.swift
//  Fawaz solo project
//
//  Created by Fawaz on 01/12/2021.
//

import Foundation
import UIKit

struct MyProfile_str {
  let image : UIImage?
  let title: String
  let text : String
}
//--------------------------------------------------------------------------
var data_MyProfile_str = [
  
  MyProfile_str(
    image: UIImage(systemName: "questionmark.circle"),
    title: (NSLocalizedString("Common Questions", comment: "")),
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "text.bubble"),
    title: (NSLocalizedString("Connect with us", comment: "")),
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "text.alignright"),
    title: (NSLocalizedString("Terms of use", comment: "")),
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "doc.text"),
    title: (NSLocalizedString("Privacy policy", comment: "")),
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "gear"),
    title: (NSLocalizedString("Settings", comment: "")),
    text: ""
  ),
  
]
