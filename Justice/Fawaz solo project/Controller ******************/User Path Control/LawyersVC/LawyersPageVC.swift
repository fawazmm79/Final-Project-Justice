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
  lazy var imageLawyersPage: UIImageView = {
    let imageLawyersPage = UIImageView()
    imageLawyersPage.layer.masksToBounds = true
    imageLawyersPage.layer.cornerRadius = 10
    imageLawyersPage.translatesAutoresizingMaskIntoConstraints = false
    imageLawyersPage.backgroundColor = .systemGray
    return imageLawyersPage
  }()
  //--------------------------------------------------------------------------
  lazy var stalyLawyersPage: UILabel = {
    let stalyLawyersPage = UILabel()
    stalyLawyersPage.textAlignment = .center
    stalyLawyersPage.backgroundColor = .systemGray4
    stalyLawyersPage.textColor = .label
    stalyLawyersPage.font = .systemFont(ofSize: 20)
    stalyLawyersPage.layer.cornerRadius = 10
    stalyLawyersPage.clipsToBounds = true
    stalyLawyersPage.backgroundColor = .orange
    stalyLawyersPage.translatesAutoresizingMaskIntoConstraints = false
    return stalyLawyersPage
  }()
  //--------------------------------------------------------------------------
  lazy var nameLawyersPage: UILabel = {
    let nameLawyersPage = UILabel()
    nameLawyersPage.textAlignment = .center
    nameLawyersPage.backgroundColor = .systemGray4
    nameLawyersPage.textColor = .label
    nameLawyersPage.font = .systemFont(ofSize: 20)
    nameLawyersPage.backgroundColor = .blue
    nameLawyersPage.translatesAutoresizingMaskIntoConstraints = false
    return nameLawyersPage
  }()
  //--------------------------------------------------------------------------
  lazy var numberLawyersPage: UILabel = {
    let numberLawyersPage = UILabel()
    numberLawyersPage.textAlignment = .center
    numberLawyersPage.backgroundColor = .systemGray4
    numberLawyersPage.textColor = .label
    numberLawyersPage.font = .systemFont(ofSize: 20)
    numberLawyersPage.translatesAutoresizingMaskIntoConstraints = false
    return numberLawyersPage
  }()
  //--------------------------------------------------------------------------
  lazy var staly2LawyersPage: UILabel = {
    let staly2LawyersPage = UILabel()
    staly2LawyersPage.font = UIFont.systemFont(ofSize: 18)
    staly2LawyersPage.numberOfLines = 0
    staly2LawyersPage.textColor = .label
    staly2LawyersPage.translatesAutoresizingMaskIntoConstraints = false
    staly2LawyersPage.backgroundColor = .systemBlue
    staly2LawyersPage.layer.cornerRadius = 10
    staly2LawyersPage.clipsToBounds = true
    return staly2LawyersPage
  }()
  //--------------------------------------------------------------------------
  lazy var textLawyersPage: UILabel = {
    let textLawyersPage = UILabel()
    textLawyersPage.backgroundColor = .systemGray4
    textLawyersPage.textColor = .orange
    textLawyersPage.font = .systemFont(ofSize: 18)
    textLawyersPage.numberOfLines = 12
    textLawyersPage.textAlignment = .right
    textLawyersPage.translatesAutoresizingMaskIntoConstraints = false
    return textLawyersPage
  }()
  //--------------------------------------------------------------------------
  lazy var buttonLawyersPage: UIButton = {
    let buttonLawyersPage = UIButton()
    buttonLawyersPage.setTitle("اتصال", for: .normal)
    buttonLawyersPage.setTitleColor(.label, for: .normal)
    buttonLawyersPage.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    buttonLawyersPage.layer.cornerRadius = 20
    buttonLawyersPage.clipsToBounds = true
    buttonLawyersPage.translatesAutoresizingMaskIntoConstraints = false
    buttonLawyersPage.backgroundColor = .systemGray4
    //Add a Simple Alert with Buttons
    buttonLawyersPage.addTarget(self, action: #selector(popupAlert), for: .touchUpInside)
    return buttonLawyersPage
  }()
  //--------------------------------------------------------------------------
  lazy var button2LawyersPage: UIButton = {
    let button2LawyersPage = UIButton()
    button2LawyersPage.setTitle("اتصال", for: .normal)
    button2LawyersPage.setTitleColor(.label, for: .normal)
    button2LawyersPage.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    button2LawyersPage.layer.cornerRadius = 20
    button2LawyersPage.clipsToBounds = true
    button2LawyersPage.translatesAutoresizingMaskIntoConstraints = false
    button2LawyersPage.backgroundColor = .orange
    //Add a Simple Alert with Buttons
    button2LawyersPage.addTarget(self, action: #selector(popupAlert2), for: .touchUpInside)
    return button2LawyersPage
  }()
  //--------------------------------------------------------------------------
  func allConstraint(){
    
    view.addSubview(imageLawyersPage)
    NSLayoutConstraint.activate([
      imageLawyersPage.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
      imageLawyersPage.centerXAnchor.constraint(equalTo:view.centerXAnchor),
      imageLawyersPage.widthAnchor.constraint(equalToConstant: 100),
      imageLawyersPage.heightAnchor.constraint(equalToConstant: 100)
    ])
    //------------------------------------------------------------------------
    view.addSubview(stalyLawyersPage)
    NSLayoutConstraint.activate([
      stalyLawyersPage.topAnchor.constraint(equalTo: imageLawyersPage.bottomAnchor, constant: 10),
      stalyLawyersPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stalyLawyersPage.widthAnchor.constraint(equalToConstant: 350),
      stalyLawyersPage.heightAnchor.constraint(equalToConstant: 80)
    ])
    //------------------------------------------------------------------------
    view.addSubview(nameLawyersPage)
    NSLayoutConstraint.activate([
      nameLawyersPage.topAnchor.constraint(equalTo: imageLawyersPage.bottomAnchor, constant: 15),
      nameLawyersPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameLawyersPage.widthAnchor.constraint(equalToConstant: 340),
      nameLawyersPage.heightAnchor.constraint(equalToConstant: 30)
    ])
    //------------------------------------------------------------------------
    view.addSubview(numberLawyersPage)
    NSLayoutConstraint.activate([
      numberLawyersPage.topAnchor.constraint(equalTo:nameLawyersPage.bottomAnchor, constant: 10),
      numberLawyersPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      numberLawyersPage.widthAnchor.constraint(equalToConstant: 340),
      numberLawyersPage.heightAnchor.constraint(equalToConstant: 30)
    ])
    //------------------------------------------------------------------------
    view.addSubview(staly2LawyersPage)
    NSLayoutConstraint.activate([
      staly2LawyersPage.topAnchor.constraint(equalTo: numberLawyersPage.bottomAnchor, constant: 20),
      staly2LawyersPage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:20),
      staly2LawyersPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      staly2LawyersPage.heightAnchor.constraint(equalToConstant: 230)
    ])
    //------------------------------------------------------------------------
    view.addSubview(textLawyersPage)
    NSLayoutConstraint.activate([
      textLawyersPage.topAnchor.constraint(equalTo: numberLawyersPage.bottomAnchor, constant: 30),
      textLawyersPage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:30),
      textLawyersPage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
    ])
    //------------------------------------------------------------------------
    view.addSubview(buttonLawyersPage)
    self.view.addSubview(buttonLawyersPage)
    NSLayoutConstraint.activate([
      buttonLawyersPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonLawyersPage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120),
      buttonLawyersPage.widthAnchor.constraint(equalToConstant: 350),
      buttonLawyersPage.heightAnchor.constraint(equalToConstant: 70)
    ])
    //------------------------------------------------------------------------
    view.addSubview(button2LawyersPage)
    self.view.addSubview(button2LawyersPage)
    NSLayoutConstraint.activate([
      button2LawyersPage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button2LawyersPage.topAnchor.constraint(equalTo: buttonLawyersPage.bottomAnchor, constant: 20),
      button2LawyersPage.widthAnchor.constraint(equalToConstant: 350),
      button2LawyersPage.heightAnchor.constraint(equalToConstant: 70)
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
