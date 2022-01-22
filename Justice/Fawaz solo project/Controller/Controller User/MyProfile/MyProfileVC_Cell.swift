//
//  File.swift
//  Fawaz solo project
//
//  Created by Fawaz on 01/12/2021.
//

import Foundation
import UIKit

class MyProfileVC_Cell: UITableViewCell {
  
  static let identifier = "MyProfileVC_Cell_key"
  
  //-------------------------------------------------------------------------
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    
    super.init(style: style , reuseIdentifier: reuseIdentifier)
    
    allConstraint()
    
  }
  //-------------------------------------------------------------------------
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  //-------------------------------------------------------------------------
  lazy var imageCell: UIImageView = {
    let imageCell = UIImageView()
    imageCell.translatesAutoresizingMaskIntoConstraints = false
    imageCell.layer.masksToBounds = true
    imageCell.layer.cornerRadius = 10
    imageCell.contentMode = .scaleAspectFit
    imageCell.tintColor = .label
    imageCell.backgroundColor = .systemGray4
    return imageCell
  }()
  //-------------------------------------------------------------------------
  lazy var titleCell: UILabel = {
    let titleCell = UILabel()
    titleCell.translatesAutoresizingMaskIntoConstraints = false
    titleCell.textColor = .label
    titleCell.textAlignment = .right
    titleCell.backgroundColor = .systemGray4
    titleCell.font = UIFont.systemFont(ofSize: 18)
    return titleCell
  }()
  //-------------------------------------------------------------------------
  lazy var textCell: UILabel = {
    let textCell = UILabel()
    return textCell
  }()
  //-------------------------------------------------------------------------
  lazy var stalyCell: UILabel = {
    let stalyCell = UILabel()
    stalyCell.font = UIFont.systemFont(ofSize: 18)
    stalyCell.numberOfLines = 0
    stalyCell.textColor = .label
    stalyCell.translatesAutoresizingMaskIntoConstraints = false
    stalyCell.backgroundColor = .systemGray4
    stalyCell.layer.cornerRadius = 10
    stalyCell.clipsToBounds = true
    return stalyCell
  }()
  //-------------------------------------------------------------------------
  func allConstraint(){
    
    self.addSubview(imageCell)
    NSLayoutConstraint.activate([
      imageCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      imageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      imageCell.heightAnchor.constraint(equalToConstant: 50),
      imageCell.widthAnchor.constraint(equalToConstant: 50)
    ])
    //-----------------------------------------------------------------------
    self.addSubview(stalyCell)
    NSLayoutConstraint.activate([
      stalyCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      stalyCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
      stalyCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -5),
      stalyCell.heightAnchor.constraint(equalToConstant: 50)
    ])
    //-----------------------------------------------------------------------
    self.addSubview(titleCell)
    NSLayoutConstraint.activate([
      titleCell.rightAnchor.constraint(equalTo:imageCell.leftAnchor, constant: -15),
      titleCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
      titleCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      titleCell.heightAnchor.constraint(equalToConstant: 40)
    ])
  }
}
//--------------------------------------------------------------------------
