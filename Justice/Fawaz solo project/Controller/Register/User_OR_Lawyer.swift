//
//  Filex.swift
//  Fawaz solo project
//
//  Created by Fawaz on 12/12/2021.
//

import UIKit
import TransitionButton

class User_OR_Lawyer: UIViewController {
  
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor(red: 0.26, green: 0.53, blue: 0.46, alpha: 1.00)
    
    allConstraint()
  }
  //--------------------------------------------------------------------------
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.backgroundColor = UIColor(red: 0.26, green: 0.53, blue: 0.46, alpha: 1.00)
    scrollView.autoresizingMask = .flexibleHeight
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.bounces = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  //--------------------------------------------------------------------------
  lazy var containerView: UIView = {
    let containerView = UIView()
    containerView.backgroundColor = UIColor(red: 0.26, green: 0.53, blue: 0.46, alpha: 1.00)
    containerView.translatesAutoresizingMaskIntoConstraints = false
    return containerView
  }()
  //--------------------------------------------------------------------------
  lazy var appIcon: UIImageView = {
    let appIcon = UIImageView()
    appIcon.contentMode = .scaleAspectFit
    appIcon.translatesAutoresizingMaskIntoConstraints = false
    appIcon.image = UIImage(named: "d1.png")
    appIcon.layer.cornerRadius = 25
    appIcon.layer.masksToBounds = true
    return appIcon
  }()
  //--------------------------------------------------------------------------
  lazy var labelWelcome: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Party LET", size: 35)
    label.text = """
    Welcome to the justice application
    
    The application provides legal information and advice from certified lawyers to help you solve any case
    """
    label.translatesAutoresizingMaskIntoConstraints = false
    label.layer.cornerRadius = 25
    label.layer.masksToBounds = true
    label.textAlignment = .center
    label.numberOfLines = 0
//    label.font = label.font.withSize(20)
    return label
  }()
  //--------------------------------------------------------------------------
  lazy var userPageButton: TransitionButton = {
    let userPage = TransitionButton()
    userPage.translatesAutoresizingMaskIntoConstraints = false
    userPage.setTitle(NSLocalizedString("User", comment: ""), for: .normal)
    userPage.setTitleColor(.black, for: .normal)
    userPage.backgroundColor = UIColor(red: 0.97, green: 0.81, blue: 0.36, alpha: 1.00)
    userPage.layer.cornerRadius = 25
    userPage.layer.masksToBounds = true
    userPage.addTarget(self, action: #selector(logInUserButtonTapped), for: .touchUpInside)
    userPage.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return userPage
  }()
  //--------------------------------------------------------------------------
  lazy var lawyerPageButton: TransitionButton = {
    let lawyerPage = TransitionButton()
    lawyerPage.translatesAutoresizingMaskIntoConstraints = false
    lawyerPage.setTitle(NSLocalizedString("Lawyer", comment: ""), for: .normal)
    lawyerPage.setTitleColor(.black, for: .normal)
    lawyerPage.backgroundColor = .white
    lawyerPage.layer.cornerRadius = 25
    lawyerPage.layer.masksToBounds = true
    lawyerPage.addTarget(self, action: #selector(logInLawyerButtonTapped), for: .touchUpInside)
    lawyerPage.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    return lawyerPage
  }()
  //--------------------------------------------------------------------------
  func allConstraint(){
    
    view.addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: view.topAnchor),
      scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
      scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
    //------------------------------------------------------------------------
    scrollView.addSubview(containerView)
    NSLayoutConstraint.activate([
      containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      containerView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
      containerView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
      containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
      containerView.heightAnchor.constraint(equalToConstant: 900),
    ])
    //------------------------------------------------------------------------
    containerView.addSubview(appIcon)
    NSLayoutConstraint.activate([
      appIcon.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      appIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 50),
      appIcon.widthAnchor.constraint(equalToConstant: 200),
      appIcon.heightAnchor.constraint(equalToConstant: 200),
    ])
    //------------------------------------------------------------------------
    containerView.addSubview(labelWelcome)
    NSLayoutConstraint.activate([
      labelWelcome.topAnchor.constraint(equalTo: appIcon.bottomAnchor, constant: 50),
      labelWelcome.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      labelWelcome.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
      labelWelcome.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
    ])
    //------------------------------------------------------------------------
    containerView.addSubview(userPageButton)
    NSLayoutConstraint.activate([
      userPageButton.topAnchor.constraint(equalTo: labelWelcome.bottomAnchor, constant:50),
      userPageButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      userPageButton.widthAnchor.constraint(equalToConstant: 300),
      userPageButton.heightAnchor.constraint(equalToConstant: 80),
    ])
    //------------------------------------------------------------------------
    containerView.addSubview(lawyerPageButton)
    NSLayoutConstraint.activate([
      lawyerPageButton.topAnchor.constraint(equalTo: userPageButton.bottomAnchor, constant:30),
      lawyerPageButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      lawyerPageButton.widthAnchor.constraint(equalToConstant: 300),
      lawyerPageButton.heightAnchor.constraint(equalToConstant: 80),
    ])
  }
  //--------------------------------------------------------------------------
  @objc private func logInUserButtonTapped() {
    
    userPageButton.startAnimation()
    
    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
      self.userPageButton.stopAnimation(animationStyle: .expand, revertAfterDelay:1)
      DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
        let vc = LogIn_asUser()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
      }
    }
  }
  //--------------------------------------------------------------------------
  @objc private func logInLawyerButtonTapped() {
    
    lawyerPageButton.startAnimation()
    
    DispatchQueue.main.asyncAfter(deadline: .now()+2) {
      self.lawyerPageButton.stopAnimation(animationStyle: .expand, revertAfterDelay:1)
      DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
        let vc = LogIn_asLawyer()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
      }
    }
  }
}
//--------------------------------------------------------------------------
