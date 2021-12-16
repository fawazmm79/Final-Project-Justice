//
//  ServicePageVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class ServicePageVC : UIViewController{
  
  var restFromVC2: A?
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
//    view.backgroundColor = .red
    
    allConstraint()
  }
  //--------------------------------------------------------------------------
  fileprivate let application = UIApplication.shared
  //--------------------------------------------------------------------------
  lazy var imageServicePage: UIImageView = {
    let imageServicePage = UIImageView()
    imageServicePage.layer.masksToBounds = true
    imageServicePage.layer.cornerRadius = 10
    imageServicePage.translatesAutoresizingMaskIntoConstraints = false
    imageServicePage.backgroundColor = .systemGray
    return imageServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var stalyServicePage: UILabel = {
    let stalyServicePage = UILabel()
    stalyServicePage.textAlignment = .center
    stalyServicePage.backgroundColor = .systemGray4
    stalyServicePage.textColor = .label
    stalyServicePage.font = .systemFont(ofSize: 20)
    stalyServicePage.layer.cornerRadius = 10
    stalyServicePage.clipsToBounds = true
    stalyServicePage.backgroundColor = .systemGray4
    stalyServicePage.translatesAutoresizingMaskIntoConstraints = false
    return stalyServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var nameServicePage: UILabel = {
    let nameServicePage = UILabel()
    nameServicePage.textAlignment = .center
    nameServicePage.backgroundColor = .systemGray4
    nameServicePage.textColor = .label
    nameServicePage.font = .systemFont(ofSize: 20)
//    nameServicePage.backgroundColor = .blue
    nameServicePage.translatesAutoresizingMaskIntoConstraints = false
    return nameServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var numberServicePage: UILabel = {
    let numberServicePage = UILabel()
    numberServicePage.textAlignment = .center
    numberServicePage.backgroundColor = .systemGray4
    numberServicePage.textColor = .label
    numberServicePage.font = .systemFont(ofSize: 20)
    numberServicePage.translatesAutoresizingMaskIntoConstraints = false
    return numberServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var staly2ServicePage: UILabel = {
    let staly2ServicePage = UILabel()
    staly2ServicePage.font = UIFont.systemFont(ofSize: 18)
    staly2ServicePage.numberOfLines = 0
    staly2ServicePage.textColor = .label
    staly2ServicePage.translatesAutoresizingMaskIntoConstraints = false
    staly2ServicePage.backgroundColor = .systemGray4
    staly2ServicePage.layer.cornerRadius = 10
    staly2ServicePage.clipsToBounds = true
    return staly2ServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var textServicePage: UILabel = {
    let textServicePage = UILabel()
    textServicePage.backgroundColor = .systemGray4
    textServicePage.textColor = .label
    textServicePage.font = .systemFont(ofSize: 18)
    textServicePage.numberOfLines = 12
    textServicePage.textAlignment = .natural
    textServicePage.translatesAutoresizingMaskIntoConstraints = false
    return textServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var buttonServicePage: UIButton = {
    let buttonServicePage = UIButton()
    buttonServicePage.setTitle("Call", for: .normal)
    buttonServicePage.setTitleColor(.black, for: .normal)
    buttonServicePage.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    buttonServicePage.layer.cornerRadius = 20
    buttonServicePage.clipsToBounds = true
    buttonServicePage.translatesAutoresizingMaskIntoConstraints = false
    buttonServicePage.backgroundColor = UIColor(red: 0.97, green: 0.81, blue: 0.36, alpha: 1.00)
    //Add a Simple Alert with Buttons
    buttonServicePage.addTarget(self, action: #selector(popupAlert), for: .touchUpInside)
    return buttonServicePage
  }()
  //--------------------------------------------------------------------------
  lazy var button2ServicePage: UIButton = {
    let button2ServicePage = UIButton()
    button2ServicePage.setTitle("Chat", for: .normal)
    button2ServicePage.setTitleColor(.black, for: .normal)
    button2ServicePage.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    button2ServicePage.layer.cornerRadius = 20
    button2ServicePage.clipsToBounds = true
    button2ServicePage.translatesAutoresizingMaskIntoConstraints = false
    button2ServicePage.backgroundColor = .white
    //Add a Simple Alert with Buttons
    button2ServicePage.addTarget(self, action: #selector(popupAlert2), for: .touchUpInside)
    return button2ServicePage
  }()
  //--------------------------------------------------------------------------
  func allConstraint(){
    
    view.addSubview(imageServicePage)
    NSLayoutConstraint.activate([
      imageServicePage.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
      imageServicePage.centerXAnchor.constraint(equalTo:view.centerXAnchor),
      imageServicePage.widthAnchor.constraint(equalToConstant: 100),
      imageServicePage.heightAnchor.constraint(equalToConstant: 100)
    ])
    //------------------------------------------------------------------------
    view.addSubview(stalyServicePage)
    NSLayoutConstraint.activate([
      stalyServicePage.topAnchor.constraint(equalTo: imageServicePage.bottomAnchor, constant: 10),
      stalyServicePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stalyServicePage.widthAnchor.constraint(equalToConstant: 350),
      stalyServicePage.heightAnchor.constraint(equalToConstant: 80)
    ])
    //------------------------------------------------------------------------
    view.addSubview(nameServicePage)
    NSLayoutConstraint.activate([
      nameServicePage.topAnchor.constraint(equalTo: imageServicePage.bottomAnchor, constant: 15),
      nameServicePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nameServicePage.widthAnchor.constraint(equalToConstant: 340),
      nameServicePage.heightAnchor.constraint(equalToConstant: 30)
    ])
    //------------------------------------------------------------------------
    view.addSubview(numberServicePage)
    NSLayoutConstraint.activate([
      numberServicePage.topAnchor.constraint(equalTo:nameServicePage.bottomAnchor, constant: 10),
      numberServicePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      numberServicePage.widthAnchor.constraint(equalToConstant: 340),
      numberServicePage.heightAnchor.constraint(equalToConstant: 30)
    ])
    //------------------------------------------------------------------------
    view.addSubview(staly2ServicePage)
    NSLayoutConstraint.activate([
      staly2ServicePage.topAnchor.constraint(equalTo: numberServicePage.bottomAnchor, constant: 20),
      staly2ServicePage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:20),
      staly2ServicePage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
      staly2ServicePage.heightAnchor.constraint(equalToConstant: 230)
    ])
    //------------------------------------------------------------------------
    view.addSubview(textServicePage)
    NSLayoutConstraint.activate([
      textServicePage.topAnchor.constraint(equalTo: numberServicePage.bottomAnchor, constant: 30),
      textServicePage.leftAnchor.constraint(equalTo:view.leftAnchor,constant:30),
      textServicePage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
    ])
    //------------------------------------------------------------------------
    view.addSubview(buttonServicePage)
    self.view.addSubview(buttonServicePage)
    NSLayoutConstraint.activate([
      buttonServicePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonServicePage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120),
      buttonServicePage.widthAnchor.constraint(equalToConstant: 350),
      buttonServicePage.heightAnchor.constraint(equalToConstant: 70)
    ])
    //------------------------------------------------------------------------
    view.addSubview(button2ServicePage)
    self.view.addSubview(button2ServicePage)
    NSLayoutConstraint.activate([
      button2ServicePage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button2ServicePage.topAnchor.constraint(equalTo: buttonServicePage.bottomAnchor, constant: 20),
      button2ServicePage.widthAnchor.constraint(equalToConstant: 350),
      button2ServicePage.heightAnchor.constraint(equalToConstant: 70)
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
    
    let alert = UIAlertController(title: "Do you want to call this number?",
                                  message: "",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
      self.btnCallClick()
      print("Yes call")}))
    
    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
      self.btnSettingClick()
      print("Do not call")}))
    
    self.present(alert, animated: true)
  }
  //--------------------------------------------------------------------------
  @objc func popupAlert2(sender: UIButton!){
    
    let alert = UIAlertController(title: "Do you want to start a chat?",
                                  message: "",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
      self.btnCallClick()
      print("Yes call")}))
    
    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
      self.btnSettingClick()
      print("Do not call")}))
    
    self.present(alert, animated: true)
  }
}
//--------------------------------------------------------------------------
