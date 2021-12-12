//
//  Filex.swift
//  Fawaz solo project
//
//  Created by Fawaz on 12/12/2021.
//

import UIKit

class User_OR_Lawyer: UIViewController {
  
  //--------------------------------------------------------------------------
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.backgroundColor = UIColor(named: "myBackgroundColor")
    scrollView.autoresizingMask = .flexibleHeight
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.bounces = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  //--------------------------------------------------------------------------
  lazy var containerView: UIView = {
    let containerView = UIView()
    containerView.backgroundColor = UIColor(named: "myBackgroundColor")
    containerView.translatesAutoresizingMaskIntoConstraints = false
    return containerView
  }()
  //--------------------------------------------------------------------------
  lazy var appIcon: UIImageView = {
    let appIcon = UIImageView()
    appIcon.contentMode = .scaleAspectFit
    appIcon.translatesAutoresizingMaskIntoConstraints = false
    appIcon.backgroundColor = .orange
    appIcon.layer.cornerRadius = 25
    appIcon.layer.masksToBounds = true
    return appIcon
  }()
  //--------------------------------------------------------------------------
  lazy var label: UILabel = {
    let label = UILabel()
    label.text = """
Welcome to the Justice application

The application provides all judicial and legal services and provides certified lawyers to obtain legal advice and help you solve any case
"""
//    label.backgroundColor = .a
    label.translatesAutoresizingMaskIntoConstraints = false
    label.layer.cornerRadius = 25
    label.layer.masksToBounds = true
    label.textAlignment = .center
    label.numberOfLines = 0
    label.font = label.font.withSize(20)
    return label
  }()
  //--------------------------------------------------------------------------
  lazy var userPage: UIButton = {
    let userPage = UIButton()
    userPage.translatesAutoresizingMaskIntoConstraints = false
    userPage.setTitle(NSLocalizedString("User", comment: ""), for: .normal)
    userPage.setTitleColor(.white, for: .normal)
    userPage.backgroundColor = .red
    userPage.layer.cornerRadius = 25
    userPage.layer.masksToBounds = true
    userPage.addTarget(self, action: #selector(logInUserButtonTapped), for: .touchUpInside)
    userPage.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return userPage
  }()
  //--------------------------------------------------------------------------
  lazy var lawyerPage: UIButton = {
    let lawyerPage = UIButton()
    lawyerPage.translatesAutoresizingMaskIntoConstraints = false
    lawyerPage.setTitle(NSLocalizedString("Lawyer", comment: ""), for: .normal)
    lawyerPage.setTitleColor(.white, for: .normal)
    lawyerPage.backgroundColor = .orange
    lawyerPage.layer.cornerRadius = 25
    lawyerPage.layer.masksToBounds = true
    lawyerPage.addTarget(self, action: #selector(logInLawyerButtonTapped), for: .touchUpInside)
    lawyerPage.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return lawyerPage
  }()
  //--------------------------------------------------------------------------
  func allConstraint(){
    
    view.addSubview(scrollView)
    scrollView.addSubview(containerView)
    
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
      scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    
    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
      containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
      containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      containerView.heightAnchor.constraint(equalToConstant: 900),
    ])
    
    containerView.addSubview(appIcon)
    NSLayoutConstraint.activate([
      appIcon.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      appIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
      appIcon.widthAnchor.constraint(equalToConstant: 200),
      appIcon.heightAnchor.constraint(equalToConstant: 200),
    ])
    
    containerView.addSubview(label)
    NSLayoutConstraint.activate([
      label.topAnchor.constraint(equalTo: appIcon.bottomAnchor, constant: 50),
      label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      label.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
      label.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
    ])
    
    containerView.addSubview(userPage)
    NSLayoutConstraint.activate([
      userPage.topAnchor.constraint(equalTo: label.bottomAnchor, constant:50),
      userPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      userPage.widthAnchor.constraint(equalToConstant: 300),
      userPage.heightAnchor.constraint(equalToConstant: 80),
    ])
    
    containerView.addSubview(lawyerPage)
    NSLayoutConstraint.activate([
      lawyerPage.topAnchor.constraint(equalTo: userPage.bottomAnchor, constant:30),
      lawyerPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      lawyerPage.widthAnchor.constraint(equalToConstant: 300),
      lawyerPage.heightAnchor.constraint(equalToConstant: 80),
    ])
  }
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    allConstraint()
  }
  //--------------------------------------------------------------------------
  @objc private func logInUserButtonTapped() {
    let vc = LogIn_asUser()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
  //--------------------------------------------------------------------------
  @objc private func logInLawyerButtonTapped() {
    let vc = LogIn_asLawyer()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true, completion: nil)
  }
}
//--------------------------------------------------------------------------
