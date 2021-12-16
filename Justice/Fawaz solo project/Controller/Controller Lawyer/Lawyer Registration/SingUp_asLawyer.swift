//
//  ds.swift
//  Fawaz solo project
//
//  Created by Fawaz on 12/12/2021.
//

import UIKit
import FirebaseAuth

class SingUp_asLawyer: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
  
  var lawyers: Array<Lawyer> = []
  //-------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    RegisterServiceLawyer.shared.listenToLawyers { newLawyer in
      self.lawyers = newLawyer
    }
    let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
    uImage.addGestureRecognizer(tapRecognizer)
    title = (NSLocalizedString("Register ", comment: ""))
    
    allConstraint()
    dismissKeyboard()
  }
  //-------------------------------------------------------------------------
  lazy var uImage: UIImageView = {
    let uImage = UIImageView()
    uImage.translatesAutoresizingMaskIntoConstraints = false
    uImage.backgroundColor = .systemBlue
    uImage.isUserInteractionEnabled = true
    uImage.layer.cornerRadius = 50
    return uImage
  }()
  //-------------------------------------------------------------------------
  lazy var uImagePicker : UIImagePickerController = {
    let uImagePicker = UIImagePickerController()
    uImagePicker.delegate = self
    uImagePicker.sourceType = .photoLibrary
    uImagePicker.allowsEditing = true
    return uImagePicker
  }()
  //-------------------------------------------------------------------------
  lazy var uImageName: UILabel = {
    let uImageName = UILabel()
    uImageName.translatesAutoresizingMaskIntoConstraints = false
    uImageName.textColor = .black
    uImageName.text = (NSLocalizedString("Add Picture", comment: ""))
    return uImageName
  }()
  //-------------------------------------------------------------------------
  lazy var uName: TextField_View = {
    let uName = TextField_View()
    uName.placeholder = (NSLocalizedString("Name", comment: ""))
    return uName
  }()
  //-------------------------------------------------------------------------
  lazy var uEmail: TextField_View = {
    let uEmail = TextField_View()
    uEmail.placeholder = (NSLocalizedString("Email", comment: ""))
    return uEmail
  }()
  //-------------------------------------------------------------------------
  private let uPassword: TextField_View = {
    let uPassword = TextField_View()
    uPassword.isSecureTextEntry = true
    uPassword.placeholder = (NSLocalizedString("Password", comment: ""))
    return uPassword
  }()
  
  //-------------------------------------------------------------------------
  private let singUp: Button_View = {
    let singUp = Button_View()
    singUp.setTitle(
      NSLocalizedString("Sign In", comment: ""), for: .normal)
    singUp.addTarget(
      self, action: #selector(singUpButtonTapped), for: .touchUpInside)
    return singUp
  }()
  
  //-------------------------------------------------------------------------
  let stackView: UIStackView = {
    var stackView = UIStackView()
    stackView.axis  = NSLayoutConstraint.Axis.vertical
    stackView.distribution = UIStackView.Distribution.equalSpacing
    stackView.alignment = UIStackView.Alignment.center
    stackView.spacing = 16.0
    return stackView
  }()
  
  //-------------------------------------------------------------------------
  lazy var labelLogIn: UILabel = {
    let labelLogIn = UILabel()
    labelLogIn.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(labelLogIn)
    labelLogIn.text = (NSLocalizedString("did you have account?", comment: ""))
    return labelLogIn
  }()
  //-------------------------------------------------------------------------
  lazy var buttonLogIn: UIButton = {
    let buttonLogIn = UIButton()
    buttonLogIn.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(buttonLogIn)
    buttonLogIn.setTitle(NSLocalizedString("Log In", comment: ""), for: .normal)
    
    buttonLogIn.setTitleColor(.blue, for: .normal)
    buttonLogIn.addTarget(self, action: #selector(logInButtonTapped), for: .touchUpInside)
    return buttonLogIn
  }()
  //-------------------------------------------------------------------------
  func allConstraint(){
    
    view.addSubview(uImage)
    NSLayoutConstraint.activate([
      uImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      uImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
      uImage.widthAnchor.constraint(equalToConstant: 150),
      uImage.heightAnchor.constraint(equalToConstant: 150),
    ])
    //-----------------------------------------------------------------------
    view.addSubview(uImageName)
    NSLayoutConstraint.activate([
      uImageName.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      uImageName.topAnchor.constraint(equalTo: uImage.bottomAnchor, constant: 20),
      uImageName.heightAnchor.constraint(equalToConstant: 40),
    ])
    //-----------------------------------------------------------------------
    stackView.addArrangedSubview(uName)
    stackView.addArrangedSubview(uEmail)
    stackView.addArrangedSubview(uPassword)
    stackView.addArrangedSubview(singUp)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
      stackView.topAnchor.constraint(equalTo: uImageName.bottomAnchor, constant: 20),
      stackView.widthAnchor.constraint(equalToConstant: 500),
    ])
    //-----------------------------------------------------------------------
    NSLayoutConstraint.activate([
      labelLogIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
      labelLogIn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant:50),
      labelLogIn.heightAnchor.constraint(equalToConstant: 50),
    ])
    //------------------------------------------------------------------------
    NSLayoutConstraint.activate([
      buttonLogIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
      buttonLogIn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant:-50),
      buttonLogIn.heightAnchor.constraint(equalToConstant: 50),
    ])
  }
  //-------------------------------------------------------------------------
  func dismissKeyboard(){
    let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tapGesture)
    tapGesture.cancelsTouchesInView = false
  }
  //-------------------------------------------------------------------------
  @objc private func singUpButtonTapped() {
    
    // linke with firebase
    let email = uEmail.text ?? ""
    let password = uPassword.text ?? ""
    let firstNam = uName.text ?? ""
    let uuid = UUID().uuidString
    let image = uImage.image
    
    if email.isEmpty || password.isEmpty || firstNam.isEmpty {
      return
    }
    Auth.auth().createUser(withEmail: email, password: password) { result, error in
      if error != nil {
        print(error as Any)
        return
      }
    }
    
    RegisterServiceLawyer.shared.addLawyer(
      lawyer: Lawyer(id: uuid, name: firstNam, image: "f", latitude: 0.0 , longitude: 0.0)
    )
    
    //open TabVC bage
    let vc = TabVC()
    vc.modalPresentationStyle = .fullScreen
    vc.modalTransitionStyle = .flipHorizontal
    self.present(vc, animated: true, completion: nil)
  }
  //-------------------------------------------------------------------------
  @objc func imageTapped() { // image picker in register page
    print("Image tapped")
    present(uImagePicker, animated: true)
  }
  //-------------------------------------------------------------------------
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    let image = info[.editedImage] ?? info [.originalImage] as? UIImage
    uImage.image = image as? UIImage
    dismiss(animated: true)
  }
  //-------------------------------------------------------------------------
  @objc private func logInButtonTapped() {
    let vc = LogIn_asLawyer()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
}
//--------------------------------------------------------------------------
