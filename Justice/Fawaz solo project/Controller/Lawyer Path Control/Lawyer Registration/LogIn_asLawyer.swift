//
//  xx.swift
//  Fawaz solo project
//
//  Created by Fawaz on 12/12/2021.
//

import UIKit
import FirebaseAuth

class LogIn_asLawyer : UIViewController, UITextFieldDelegate {
  
  //-------------------------------------------------------------------------
  //MARK: - All User
  
  lazy var uEmail: TextField_View = {
    let uEmail = TextField_View()
    uEmail.placeholder = (NSLocalizedString("Email", comment: ""))
    view.addSubview(uEmail)
    return uEmail
  }()
  //-------------------------------------------------------------------------
  lazy var uPassword: TextField_View = {
    let uPassword = TextField_View()
    uPassword.placeholder = (NSLocalizedString("Password", comment: ""))
    view.addSubview(uPassword)
    return uPassword
  }()
  
  //-------------------------------------------------------------------------
  //MARK: - Login Button
  
  lazy var logIn: Button_View = {
    let logIn = Button_View()
    logIn.setTitle(NSLocalizedString("Log In", comment: ""), for: .normal)
    logIn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    view.addSubview(logIn)
    return logIn
  }()
  
  //-------------------------------------------------------------------------
  //MARK: - stackView
  
  let stackView: UIStackView = {
    var stackView = UIStackView()
    stackView.axis = NSLayoutConstraint.Axis.vertical
    stackView.distribution = UIStackView.Distribution.equalSpacing
    stackView.alignment = UIStackView.Alignment.center
    stackView.spacing = 16.0
    return stackView
  }()
  
  //-------------------------------------------------------------------------
  //MARK: - Go To SingIn Page
  
  lazy var labelSingIn: UILabel = {
    let labelSingIn = UILabel()
    labelSingIn.translatesAutoresizingMaskIntoConstraints = false
    labelSingIn.text = (NSLocalizedString("Don't have account?", comment: ""))
    self.view.addSubview(labelSingIn)
    labelSingIn.backgroundColor = .orange
    return labelSingIn
  }()
  //-------------------------------------------------------------------------
  lazy var buttonSingIn: UIButton = {
    let buttonSingIn = UIButton()
    buttonSingIn.translatesAutoresizingMaskIntoConstraints = false
    buttonSingIn.setTitle(NSLocalizedString("Sing In", comment: ""), for: .normal)
    buttonSingIn.backgroundColor = .orange
    buttonSingIn.setTitleColor(.blue, for: .normal)
    buttonSingIn.addTarget(self, action: #selector(SingUpButtonTapped), for: .touchUpInside)
    self.view.addSubview(buttonSingIn)
    return buttonSingIn
  }()
  
  //-------------------------------------------------------------------------
  //MARK: - logInWeb
  
  lazy var logInWebGoogle: ButtonWebView = {
    let logInWebGoogle = ButtonWebView()
    logInWebGoogle.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    self.view.addSubview(logInWebGoogle)
    return logInWebGoogle
  }()
  //-------------------------------------------------------------------------
  lazy var logInWebFacebook: ButtonWebView = {
    let logInWebFacebook = ButtonWebView()
    logInWebFacebook.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    self.view.addSubview(logInWebFacebook)
    return logInWebFacebook
  }()
  //-------------------------------------------------------------------------
  lazy var logInWebMicrosoft: ButtonWebView = {
    let logInWebMicrosoft = ButtonWebView()
    logInWebMicrosoft.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    self.view.addSubview(logInWebMicrosoft)
    return logInWebMicrosoft
  }()
  //-------------------------------------------------------------------------
  //MARK: - allConstraint
  
  func allConstraint(){
    
    stackView.addArrangedSubview(uEmail)
    stackView.addArrangedSubview(uPassword)
    stackView.addArrangedSubview(logIn)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
      stackView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor,constant:250),
      stackView.widthAnchor.constraint(equalToConstant: 500),
    ])
    //-----------------------------------------------------------------------
    NSLayoutConstraint.activate([
      labelSingIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
      labelSingIn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant:50),
      labelSingIn.heightAnchor.constraint(equalToConstant: 50),
    ])
    //-----------------------------------------------------------------------
    NSLayoutConstraint.activate([
      buttonSingIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
      buttonSingIn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant:-50),
      buttonSingIn.heightAnchor.constraint(equalToConstant: 50),
    ])
    //-----------------------------------------------------------------------
    NSLayoutConstraint.activate([
      logInWebGoogle.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      logInWebGoogle.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
    ])
    //-----------------------------------------------------------------------
    NSLayoutConstraint.activate([
      logInWebFacebook.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      logInWebFacebook.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
    //-----------------------------------------------------------------------
    NSLayoutConstraint.activate([
      logInWebMicrosoft.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      logInWebMicrosoft.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
    ])
  }
  
  //-------------------------------------------------------------------------
  //MARK: - viewDidLoad LogIn_asUser
  
  var rememberData: Bool! = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .orange
    //     view.backgroundColor = UIColor (named: "myBackground")
    title = (NSLocalizedString("Log In", comment: ""))
    
    uEmail.delegate = self
    uPassword.delegate = self
    uEmail.text = UserDefaults.standard.value(forKey: "em") as? String
    uPassword.text = UserDefaults.standard.value(forKey: "pa") as? String
    
    allConstraint()
    dismissKeyboard()
  }
  
  //-------------------------------------------------------------------------
  //MARK: - dismissKeyboard
  
  func dismissKeyboard(){
    let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tapGesture)
    tapGesture.cancelsTouchesInView = false
  }
  
  //-------------------------------------------------------------------------
  //MARK: - loginButtonTapped
  
  var rem: Bool! = false
  @objc private func loginButtonTapped() {
    
    let email = uEmail.text ?? ""
    let password = uPassword.text ?? ""
    
    UserDefaults.standard.set(email, forKey: "em")
    UserDefaults.standard.set(password, forKey: "pa")
    
    if (rem == true){
      UserDefaults.standard.set("0", forKey: "t")
    }
    else{
      UserDefaults.standard.set("1", forKey: "f")
    }
    
    if email.isEmpty || password.isEmpty {
      return
    }
    
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
      if error != nil {
        print(error as Any)
        return
      }
      
      //oben TabVC bage
      let vc = TabVC()
      vc.modalPresentationStyle = .fullScreen
      self.present(vc, animated: true, completion: nil)
    }
  }
  
  //-------------------------------------------------------------------------
  //MARK: - SingUpButtonTapped
  
  @objc private func SingUpButtonTapped() {
    let vc = SingUp_asLawyer()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
  
  //-------------------------------------------------------------------------
  //MARK: - textFieldShouldReturn
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    uEmail.resignFirstResponder()
    uPassword.resignFirstResponder()
    return true
  }
}
//--------------------------------------------------------------------------
