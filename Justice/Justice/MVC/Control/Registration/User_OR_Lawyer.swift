//
//  User_OR_Lawyer.swift
//  Justice
//
//  Created by Fawaz on 08/12/2021.
//

import UIKit

class User_OR_Lawyer: UIViewController {
  
  lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 10)
  //--------------------------------------------------------------------------
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.backgroundColor = .systemGray
    scrollView.frame = self.view.bounds
    scrollView.contentSize = contentViewSize
    scrollView.autoresizingMask = .flexibleHeight
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.bounces = true
    return scrollView
  }()
  //--------------------------------------------------------------------------
  lazy var containerView: UIView = {
    let containerView = UIView()
    containerView.backgroundColor = .systemGray4
    containerView.frame.size = contentViewSize
    return containerView
  }()
  //--------------------------------------------------------------------------
  lazy var appIcon: UIImageView = {
    let appIcon = UIImageView()
    appIcon.contentMode = .scaleAspectFit
    appIcon.translatesAutoresizingMaskIntoConstraints = false
    appIcon.backgroundColor = .white
    //    appIcon.layer.cornerRadius = 25
    appIcon.layer.masksToBounds = true
    return appIcon
  }()
  //--------------------------------------------------------------------------
  lazy var userPage: UIButton = {
    let userPage = UIButton()
    userPage.translatesAutoresizingMaskIntoConstraints = false
    userPage.setTitle(NSLocalizedString("User", comment: ""), for: .normal)
    userPage.setTitleColor(.white, for: .normal)
    userPage.backgroundColor = .red
    userPage.layer.cornerRadius = 0
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
    lawyerPage.layer.cornerRadius = 0
    lawyerPage.layer.masksToBounds = true
    lawyerPage.addTarget(self, action: #selector(logInLawyerButtonTapped), for: .touchUpInside)
    lawyerPage.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return lawyerPage
  }()
  //--------------------------------------------------------------------------
  func allConstraint(){
    
    containerView.addSubview(appIcon)
    NSLayoutConstraint.activate([
      appIcon.centerXAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.centerXAnchor),
      appIcon.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 100),
      appIcon.widthAnchor.constraint(equalToConstant: 200),
      appIcon.heightAnchor.constraint(equalToConstant: 200),
    ])
    
    containerView.addSubview(userPage)
    NSLayoutConstraint.activate([
      userPage.centerYAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.centerYAnchor, constant: 150),
      userPage.centerXAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.centerXAnchor),
      userPage.widthAnchor.constraint(equalToConstant: 300),
      userPage.heightAnchor.constraint(equalToConstant: 80),
    ])
    
    containerView.addSubview(lawyerPage)
    NSLayoutConstraint.activate([
      lawyerPage.topAnchor.constraint(equalTo: userPage.bottomAnchor, constant:30),
      lawyerPage.centerXAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.centerXAnchor),
      lawyerPage.widthAnchor.constraint(equalToConstant: 300),
      lawyerPage.heightAnchor.constraint(equalToConstant: 80),
    ])
  }
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    
    view.addSubview(scrollView)
    scrollView.addSubview(containerView)
    
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
