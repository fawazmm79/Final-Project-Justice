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
    image: UIImage(systemName: "globe"),
    title: "Language",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "questionmark.circle"),
    title: "Common Questions",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "text.bubble"),
    title: "Connect with us",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "text.alignright"),
    title: "Terms of use",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "doc.text"),
    title: "Privacy policy",
    text: ""
  ),
  
  MyProfile_str(
    image: UIImage(systemName: "gear"),
    title: "Settings",
    text: ""
  ),
  
]
