//
//  NewsVC_Cell.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class NewsVC_Cell: UITableViewCell {
  
  static let identifier = "NewsVC_Cell_key"
  
  //--------------------------------------------------------------------------
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
    
    super.init(style: style , reuseIdentifier: reuseIdentifier)
    
    allConstraint()
  }
  //--------------------------------------------------------------------------
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  //--------------------------------------------------------------------------
  lazy var imageCell: UIImageView = {
    let imageCell = UIImageView()
    imageCell.translatesAutoresizingMaskIntoConstraints = false
    imageCell.layer.cornerRadius = 10
    imageCell.clipsToBounds = true
    imageCell.backgroundColor = .systemGray5
    imageCell.contentMode = .scaleAspectFill
    return imageCell
  }()
  //--------------------------------------------------------------------------
  lazy var titleCell: UILabel = {
    let titleCell = UILabel()
    titleCell.translatesAutoresizingMaskIntoConstraints = false
    titleCell.textColor = .label
    titleCell.textAlignment = .right
    titleCell.numberOfLines = 0
    titleCell.backgroundColor = .systemGray5
    titleCell.font = UIFont.systemFont(ofSize: 20)
    return titleCell
  }()
  //  let text = UILabel()
  //--------------------------------------------------------------------------
  lazy var stalyCell: UILabel = {
    let stalyCell = UILabel()
    stalyCell.font = UIFont.systemFont(ofSize: 20)
    stalyCell.numberOfLines = 0
    stalyCell.textColor = .label
    stalyCell.translatesAutoresizingMaskIntoConstraints = false
    stalyCell.backgroundColor = .systemGray5
    stalyCell.layer.cornerRadius = 10
    stalyCell.clipsToBounds = true
    return stalyCell
  }()
  //--------------------------------------------------------------------------
  func allConstraint(){
    
    self.addSubview(imageCell)
    NSLayoutConstraint.activate([
      imageCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
      imageCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      imageCell.heightAnchor.constraint(equalToConstant: 120),
      imageCell.widthAnchor.constraint(equalToConstant: 120)
    ])
    //------------------------------------------------------------------------
    self.addSubview(stalyCell)
    NSLayoutConstraint.activate([
      stalyCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
      stalyCell.centerYAnchor.constraint(equalTo: centerYAnchor),
      stalyCell.heightAnchor.constraint(equalToConstant: 120),
      stalyCell.widthAnchor.constraint(equalToConstant: 240)
    ])
    //------------------------------------------------------------------------
    self.addSubview(titleCell)
    NSLayoutConstraint.activate([
      titleCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
      titleCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      titleCell.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
      titleCell.widthAnchor.constraint(equalToConstant: 220)
    ])
  }
}
//--------------------------------------------------------------------------
