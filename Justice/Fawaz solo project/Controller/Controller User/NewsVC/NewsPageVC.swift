//
//  NewsPageVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class NewsPageVC: UIViewController{
  
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    allConstraint()
  }
  //--------------------------------------------------------------------------
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.backgroundColor = UIColor (named: "myBackgroundColor")
    scrollView.autoresizingMask = .flexibleHeight
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.bounces = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  //--------------------------------------------------------------------------
  lazy var containerView: UIView = {
    let containerView = UIView()
    containerView.backgroundColor = UIColor (named: "myBackgroundColor")
    containerView.translatesAutoresizingMaskIntoConstraints = false
    return containerView
  }()
  //--------------------------------------------------------------------------
  lazy var imageNewsPage: UIImageView = {
    let imageNewsPage = UIImageView()
    imageNewsPage.translatesAutoresizingMaskIntoConstraints = false
    imageNewsPage.backgroundColor = .systemGray5
    return imageNewsPage
  }()
  //--------------------------------------------------------------------------
  lazy var stalyNewsPage: UILabel = {
    let stalyNewsPage = UILabel()
    stalyNewsPage.textAlignment = .center
    stalyNewsPage.backgroundColor = .systemGray5
    stalyNewsPage.textColor = .label
    stalyNewsPage.font = .systemFont(ofSize: 20)
    stalyNewsPage.layer.cornerRadius = 10
    stalyNewsPage.clipsToBounds = true
    stalyNewsPage.translatesAutoresizingMaskIntoConstraints = false
    return stalyNewsPage
  }()
  //--------------------------------------------------------------------------
  lazy var nameNewsPage: UILabel = {
    let nameNewsPage = UILabel()
    nameNewsPage.textAlignment = .center
    nameNewsPage.backgroundColor = .systemGray5
    nameNewsPage.numberOfLines = 0
    nameNewsPage.textColor = .label
    nameNewsPage.font = .systemFont(ofSize: 20)
    nameNewsPage.translatesAutoresizingMaskIntoConstraints = false
    return nameNewsPage
  }()
  //--------------------------------------------------------------------------
  lazy var staly2NewsPage: UILabel = {
    let staly2NewsPage = UILabel()
    staly2NewsPage.font = UIFont.systemFont(ofSize: 18)
    staly2NewsPage.numberOfLines = 0
    staly2NewsPage.textColor = .label
    staly2NewsPage.translatesAutoresizingMaskIntoConstraints = false
    staly2NewsPage.backgroundColor = .systemGray5
    staly2NewsPage.layer.cornerRadius = 10
    staly2NewsPage.clipsToBounds = true
    return staly2NewsPage
  }()
  //--------------------------------------------------------------------------
  lazy var textNewsPage: UILabel = {
    let textNewsPage = UILabel()
    textNewsPage.backgroundColor = .systemGray5
    textNewsPage.textColor = .label
    textNewsPage.font = .systemFont(ofSize: 18)
    textNewsPage.numberOfLines = 12
    textNewsPage.textAlignment = .right
    textNewsPage.translatesAutoresizingMaskIntoConstraints = false
    return textNewsPage
  }()
  //--------------------------------------------------------------------------
  lazy var buttonNewsPage: UIButton = {
    let buttonNewsPage = UIButton()
    return buttonNewsPage
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
    containerView.addSubview(imageNewsPage)
    NSLayoutConstraint.activate([
      imageNewsPage.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor,constant: 10),
      imageNewsPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      imageNewsPage.heightAnchor.constraint(equalToConstant: 300),
      imageNewsPage.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      imageNewsPage.rightAnchor.constraint(equalTo: containerView.rightAnchor)
    ])
    //------------------------------------------------------------------------
    containerView.addSubview(stalyNewsPage)
    NSLayoutConstraint.activate([
      stalyNewsPage.topAnchor.constraint(equalTo: imageNewsPage.bottomAnchor, constant: 10),
      stalyNewsPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      stalyNewsPage.heightAnchor.constraint(equalToConstant: 80),
      stalyNewsPage.widthAnchor.constraint(equalToConstant: 380),
    ])
    //------------------------------------------------------------------------
    containerView.addSubview(nameNewsPage)
    NSLayoutConstraint.activate([
      nameNewsPage.topAnchor.constraint(equalTo: imageNewsPage.bottomAnchor, constant: 15),
      nameNewsPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      nameNewsPage.heightAnchor.constraint(equalToConstant: 70),
      nameNewsPage.widthAnchor.constraint(equalToConstant: 370)
    ])
    //------------------------------------------------------------------------
    containerView.addSubview(staly2NewsPage)
    NSLayoutConstraint.activate([
      staly2NewsPage.topAnchor.constraint(equalTo: nameNewsPage.bottomAnchor, constant: 15),
      staly2NewsPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      staly2NewsPage.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -15),
      staly2NewsPage.widthAnchor.constraint(equalToConstant: 370)
    ])
    //------------------------------------------------------------------------
    containerView.addSubview(textNewsPage)
    NSLayoutConstraint.activate([
      textNewsPage.topAnchor.constraint(equalTo: nameNewsPage.bottomAnchor, constant: 25),
      textNewsPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      textNewsPage.widthAnchor.constraint(equalToConstant: 350)
    ])
  }
}
//--------------------------------------------------------------------------
