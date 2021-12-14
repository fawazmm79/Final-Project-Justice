//
//  LawyersPageVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class LawyersPageVC : UIViewController{
  
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    view.backgroundColor = UIColor (named: "myBackgroundColor")
    view.backgroundColor = .red
    
    allConstraint()
  }
  //--------------------------------------------------------------------------
  fileprivate let application = UIApplication.shared
  //--------------------------------------------------------------------------
  lazy var imageBlogPage: UIImageView = {
    let imageBlogPage = UIImageView()
    imageBlogPage.layer.masksToBounds = true
    imageBlogPage.layer.cornerRadius = 10
    imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
    imageBlogPage.backgroundColor = .systemGray
    return imageBlogPage
  }()
  //--------------------------------------------------------------------------
  lazy var staly: UILabel = {
    let staly = UILabel()
    staly.textAlignment = .center
    staly.backgroundColor = .systemGray4
    staly.textColor = .label
    staly.font = .systemFont(ofSize: 20)
    staly.layer.cornerRadius = 10
    staly.clipsToBounds = true
    staly.backgroundColor = .orange
    staly.translatesAutoresizingMaskIntoConstraints = false
    return staly
  }()
  //--------------------------------------------------------------------------
  lazy var nameBlogPage: UILabel = {
    let nameBlogPage = UILabel()
    nameBlogPage.textAlignment = .center
    nameBlogPage.backgroundColor = .systemGray4
    nameBlogPage.textColor = .label
    nameBlogPage.font = .systemFont(ofSize: 20)
    nameBlogPage.backgroundColor = .blue
    nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
    return nameBlogPage
  }()
  //--------------------------------------------------------------------------
  lazy var numberBlogePage: UILabel = {
    let numberBlogePage = UILabel()
    numberBlogePage.textAlignment = .center
    numberBlogePage.backgroundColor = .systemGray4
    numberBlogePage.textColor = .label
    numberBlogePage.font = .systemFont(ofSize: 20)
    numberBlogePage.translatesAutoresizingMaskIntoConstraints = false
    return numberBlogePage
  }()
  //--------------------------------------------------------------------------
  lazy var staly2: UILabel = {
    let staly2 = UILabel()
    staly2.font = UIFont.systemFont(ofSize: 18)
    staly2.numberOfLines = 0
    staly2.textColor = .label
    staly2.translatesAutoresizingMaskIntoConstraints = false
    staly2.backgroundColor = .systemBlue
    staly2.layer.cornerRadius = 10
    staly2.clipsToBounds = true
    return staly2
  }()
  //--------------------------------------------------------------------------
  lazy var textBlogPage: UILabel = {
    let textBlogPage = UILabel()
    textBlogPage.backgroundColor = .systemGray4
    textBlogPage.textColor = .orange
    textBlogPage.font = .systemFont(ofSize: 18)
    textBlogPage.numberOfLines = 12
    textBlogPage.textAlignment = .right
    textBlogPage.translatesAutoresizingMaskIntoConstraints = false
    return textBlogPage
  }()
  //--------------------------------------------------------------------------
  lazy var button: UIButton = {
    let button = UIButton()
    button.setTitle("اتصال", for: .normal)
    button.setTitleColor(.label, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    button.layer.cornerRadius = 20
    button.clipsToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemGray4
    //Add a Simple Alert with Buttons
    button.addTarget(self, action: #selector(popupAlert), for: .touchUpInside)
    return button
  }()
  //--------------------------------------------------------------------------
  lazy var button2: UIButton = {
    let button2 = UIButton()
    button2.setTitle("اتصال", for: .normal)
    button2.setTitleColor(.label, for: .normal)
    button2.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    button2.layer.cornerRadius = 20
    button2.clipsToBounds = true
    button2.translatesAutoresizingMaskIntoConstraints = false
    button2.backgroundColor = .orange
    //Add a Simple Alert with Buttons
    button2.addTarget(self, action: #selector(popupAlert2), for: .touchUpInside)
    return button2
  }()
  //--------------------------------------------------------------------------
  func allConstraint(){
    view.addSubview(imageBlogPage)
    NSLayoutConstraint.activate([
      imageBlogPage.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
      imageBlogPage.centerXAnchor.constraint(equalTo:view.centerXAnchor),
      imageBlogPage.widthAnchor.constraint(equalToConstant: 100),
      imageBlogPage.heightAnchor.constraint(equalToConstant: 100)
    ])
    //------------------------------------------------------------------------
    view.addSubview(staly)
    NSLayoutConstraint.activate([
      staly.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 10),
      staly.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      staly.widthAnchor.constraint(equalToConstant: 350),
      staly.heightAnchor.constraint(equalToConstant: 80)
    ])
    //------------------------------------------------------------------------
    view.addSubview(nameBlogPage)
    NSLayoutConstraint.activate([
      nameBlogPage.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 15),
      nameBlogPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameBlogPage.widthAnchor.constraint(equalToConstant: 340),
      nameBlogPage.heightAnchor.constraint(equalToConstant: 30)
    ])
    //------------------------------------------------------------------------
    view.addSubview(numberBlogePage)
    NSLayoutConstraint.activate([
      numberBlogePage.topAnchor.constraint(equalTo:nameBlogPage.bottomAnchor, constant: 10),
      numberBlogePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      numberBlogePage.widthAnchor.constraint(equalToConstant: 340),
      numberBlogePage.heightAnchor.constraint(equalToConstant: 30)
    ])
    //------------------------------------------------------------------------
    view.addSubview(staly2)
    NSLayoutConstraint.activate([
      staly2.topAnchor.constraint(equalTo: numberBlogePage.bottomAnchor, constant: 20),
      staly2.leftAnchor.constraint(equalTo:view.leftAnchor,constant:20),
      staly2.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      staly2.heightAnchor.constraint(equalToConstant: 230)
    ])
    //------------------------------------------------------------------------
    view.addSubview(textBlogPage)
    NSLayoutConstraint.activate([
      textBlogPage.topAnchor.constraint(equalTo: numberBlogePage.bottomAnchor, constant: 30),
      textBlogPage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:30),
      textBlogPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
    ])
    //------------------------------------------------------------------------
    view.addSubview(button)
    self.view.addSubview(button)
    NSLayoutConstraint.activate([
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120),
      button.widthAnchor.constraint(equalToConstant: 350),
      button.heightAnchor.constraint(equalToConstant: 70)
    ])
    //------------------------------------------------------------------------
    view.addSubview(button2)
    self.view.addSubview(button2)
    NSLayoutConstraint.activate([
      button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
      button2.widthAnchor.constraint(equalToConstant: 350),
      button2.heightAnchor.constraint(equalToConstant: 70)
    ])
  }
  //--------------------------------------------------------------------------
  func btnSettingClick() {
    if let settingURL = URL(string: UIApplication.openSettingsURLString){
      application.open(settingURL, options: [:])
    }
  }
  //--------------------------------------------------------------------------
  func btnCallClick() {
    if let phoneURL = URL(string: "tel://0123456789") {
      if application.canOpenURL(phoneURL){
        application.open(phoneURL, options: [:], completionHandler: nil)
      }
    }
  }
  //--------------------------------------------------------------------------
  @objc func popupAlert(sender: UIButton!){
    
    let alert = UIAlertController(title: "هل تريد الاتصال بهذا الرقم؟",
                                  message: "",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { action in
      self.btnCallClick()
      print("Yes call")}))
    
    alert.addAction(UIAlertAction(title: "لا", style: .cancel, handler: { action in
      self.btnSettingClick()
      print("Do not call")}))
    
    self.present(alert, animated: true)
  }
  //--------------------------------------------------------------------------
  @objc func popupAlert2(sender: UIButton!){
    
    let alert = UIAlertController(title: "هل تريد الاتصال بهذا الرقم؟",
                                  message: "",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "نعم", style: .default, handler: { action in
      self.btnCallClick()
      print("Yes call")}))
    
    alert.addAction(UIAlertAction(title: "لا", style: .cancel, handler: { action in
      self.btnSettingClick()
      print("Do not call")}))
    
    self.present(alert, animated: true)
  }
}
//--------------------------------------------------------------------------
