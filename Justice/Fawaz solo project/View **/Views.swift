//
//  File.swift
//  Fawaz solo project
//
//  Created by Fawaz on 12/12/2021.
//

import Foundation
import UIKit

//--------------------------------------------------------------------------
class Image_View: UIImageView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentMode = .scaleAspectFit
    layer.cornerRadius = 25
    layer.masksToBounds = true
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .blue
    
    NSLayoutConstraint.activate([
      widthAnchor.constraint(equalToConstant: 150),
      heightAnchor.constraint(equalToConstant: 150)
    ])
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
//--------------------------------------------------------------------------
class TextField_View: UITextField{
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    layer.cornerRadius = 12
    layer.borderWidth = 1
    layer.borderColor = UIColor.lightGray.cgColor
    backgroundColor = .secondarySystemBackground
    textAlignment = .center
    
    NSLayoutConstraint.activate([
      widthAnchor.constraint(equalToConstant: 300),
      heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
//--------------------------------------------------------------------------
class Button_View: UIButton{
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    setTitleColor(.white, for: .normal)
    backgroundColor = .systemGray2
    layer.cornerRadius = 12
    layer.masksToBounds = true
    titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    
    NSLayoutConstraint.activate([
      widthAnchor.constraint(equalToConstant: 300),
      heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
//--------------------------------------------------------------------------
class LabelTo_View: UILabel{
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    font = UIFont.systemFont(ofSize: 12, weight: .medium)
    
    NSLayoutConstraint.activate([
      topAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
//--------------------------------------------------------------------------
class ButtonTo_View: UIButton{
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    setTitleColor(.blue, for: .normal)
    titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
//------------------------------------------------------------------------
class BackUser_OR_Lawyer: UIButton{
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    translatesAutoresizingMaskIntoConstraints = false
    setTitleColor(.white, for: .normal)
    backgroundColor = .systemGray2
    layer.cornerRadius = 12
    layer.masksToBounds = true
    titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    
    NSLayoutConstraint.activate([
      widthAnchor.constraint(equalToConstant: 300),
      heightAnchor.constraint(equalToConstant: 50)
    ])
  }
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
//--------------------------------------------------------------------------
