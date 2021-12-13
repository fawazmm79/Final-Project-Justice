//
//  LogInVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit
import FirebaseAuth

class LogIn_asUser: UIViewController, UITextFieldDelegate {
  
  //--------------------------------------------------------------------------
  //MARK: - All User
  
  lazy var welcome: UILabel = {
    let welcome = UILabel()
    welcome.text = "Welcome as User in App"
    welcome.translatesAutoresizingMaskIntoConstraints = false
    welcome.textAlignment = .center
    welcome.numberOfLines = 0
    welcome.font = welcome.font.withSize(20)
    return welcome
  }()
  //--------------------------------------------------------------------------
  lazy var uEmail: TextField_View = {
    let uEmail = TextField_View()
    uEmail.placeholder = (NSLocalizedString("Email", comment: ""))
    view.addSubview(uEmail)
    return uEmail
  }()
  //--------------------------------------------------------------------------
  lazy var uPassword: TextField_View = {
    let uPassword = TextField_View()
    uPassword.placeholder = (NSLocalizedString("Password", comment: ""))
    view.addSubview(uPassword)
    return uPassword
  }()
  //--------------------------------------------------------------------------
  //MARK: - Login Button
  
  lazy var logIn: Button_View = {
    let logIn = Button_View()
    logIn.setTitle(NSLocalizedString("Log In", comment: ""), for: .normal)
    logIn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    view.addSubview(logIn)
    return logIn
  }()
  //--------------------------------------------------------------------------
  //MARK: - stackView
  
  let stackView: UIStackView = {
    var stackView = UIStackView()
    stackView.axis = NSLayoutConstraint.Axis.vertical
    stackView.distribution = UIStackView.Distribution.equalSpacing
    stackView.alignment = UIStackView.Alignment.center
    stackView.spacing = 16.0
    return stackView
  }()
  //--------------------------------------------------------------------------
  //MARK: - Go To SingIn Page
  
  lazy var labelSingIn: UILabel = {
    let labelSingIn = UILabel()
    labelSingIn.translatesAutoresizingMaskIntoConstraints = false
    labelSingIn.text = (NSLocalizedString("Don't have account?", comment: ""))
    self.view.addSubview(labelSingIn)
    return labelSingIn
  }()
  //--------------------------------------------------------------------------
  lazy var buttonSingIn: UIButton = {
    let buttonSingIn = UIButton()
    buttonSingIn.translatesAutoresizingMaskIntoConstraints = false
    buttonSingIn.setTitle(NSLocalizedString("Sing In", comment: ""), for: .normal)
    buttonSingIn.setTitleColor(.blue, for: .normal)
    buttonSingIn.addTarget(self, action: #selector(SingUpButtonTapped), for: .touchUpInside)
    self.view.addSubview(buttonSingIn)
    return buttonSingIn
  }()
  //--------------------------------------------------------------------------
  //MARK: - backUser_OR_Lawyer
  
  lazy var backUser_OR_Lawyer: BackUser_OR_Lawyer = {
    let backUser_OR_Lawyer = BackUser_OR_Lawyer()
    backUser_OR_Lawyer.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    backUser_OR_Lawyer.setTitle(NSLocalizedString("Login as Lawyer", comment: ""), for: .normal)
    self.view.addSubview(backUser_OR_Lawyer)
    return backUser_OR_Lawyer
  }()
  //--------------------------------------------------------------------------
  //MARK: - allConstraint
  
  func allConstraint(){
    
    view.addSubview(welcome)
    NSLayoutConstraint.activate([
      welcome.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
      welcome.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      welcome.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
      welcome.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
    ])
    //------------------------------------------------------------------------
    stackView.addArrangedSubview(uEmail)
    stackView.addArrangedSubview(uPassword)
    stackView.addArrangedSubview(logIn)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(stackView)
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
      stackView.topAnchor.constraint(equalTo: welcome.bottomAnchor ,constant:50),
      stackView.widthAnchor.constraint(equalToConstant: 500),
    ])
    //------------------------------------------------------------------------
    NSLayoutConstraint.activate([
      labelSingIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
      labelSingIn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant:50),
      labelSingIn.heightAnchor.constraint(equalToConstant: 50),
    ])
    //------------------------------------------------------------------------
    NSLayoutConstraint.activate([
      buttonSingIn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
      buttonSingIn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant:-50),
      buttonSingIn.heightAnchor.constraint(equalToConstant: 50),
    ])
    //------------------------------------------------------------------------
    NSLayoutConstraint.activate([
      backUser_OR_Lawyer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
      backUser_OR_Lawyer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }
  //--------------------------------------------------------------------------
  //MARK: - viewDidLoad LogIn_asUser
  
  var rememberData: Bool! = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    title = (NSLocalizedString("Log In", comment: ""))
    
    uEmail.delegate = self
    uPassword.delegate = self
    uEmail.text = UserDefaults.standard.value(forKey: "em") as? String
    uPassword.text = UserDefaults.standard.value(forKey: "pa") as? String
    
    allConstraint()
    dismissKeyboard()
  }
  //--------------------------------------------------------------------------
  //MARK: - dismissKeyboard
  
  func dismissKeyboard(){
    let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
    view.addGestureRecognizer(tapGesture)
    tapGesture.cancelsTouchesInView = false
  }
  //--------------------------------------------------------------------------
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
  //--------------------------------------------------------------------------
  //MARK: - SingUpButtonTapped
  
  @objc private func SingUpButtonTapped() {
    let vc = SingUp_asUser()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
  //--------------------------------------------------------------------------
  //MARK: - textFieldShouldReturn
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    uEmail.resignFirstResponder()
    uPassword.resignFirstResponder()
    return true
  }
  func goBackButtonTapped(){
    let goBack = User_OR_Lawyer()
    goBack.modalPresentationStyle = .fullScreen
    self.present(goBack, animated: true, completion: nil)
  }
  //--------------------------------------------------------------------------
  @objc private func backButtonTapped(sender: UIButton!) {
    
    let alert = UIAlertController(title: "Do you want to go back to lawyer page?", message: "", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
      self.goBackButtonTapped()}))
    
    alert.addAction(UIAlertAction(title: "NO", style: .cancel, handler: { action in
      print("Do not go back")}))
    
    self.present(alert, animated: true)
    
  }
}
//--------------------------------------------------------------------------
