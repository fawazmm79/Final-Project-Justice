//
//  NewsPageVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 29/11/2021.
//

import UIKit

class NewsPageVC: UIViewController{
  
  lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView(frame: .zero)
    scrollView.backgroundColor = .systemGray
    scrollView.autoresizingMask = .flexibleHeight
    scrollView.showsHorizontalScrollIndicator = true
    scrollView.bounces = true
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    return scrollView
  }()
  //--------------------------------------------------------------------------
  lazy var containerView: UIView = {
    let containerView = UIView()
    containerView.backgroundColor = .systemBlue
    containerView.translatesAutoresizingMaskIntoConstraints = false
    return containerView
  }()
  //--------------------------------------------------------------------------
  let imageBlogPage = UIImageView()
  let staly = UILabel()
  let nameBlogPage = UILabel()
  let staly2 = UILabel()
  let textBlogPage = UILabel()
  let button = UIButton()
  
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
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
    
    //------------------------------------------------------------------------
    imageBlogPage.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(imageBlogPage)
    imageBlogPage.backgroundColor = .systemGray4
    
    NSLayoutConstraint.activate([
      imageBlogPage.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor,constant: 10),
      imageBlogPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      imageBlogPage.heightAnchor.constraint(equalToConstant: 300),
      imageBlogPage.leftAnchor.constraint(equalTo: containerView.leftAnchor),
      imageBlogPage.rightAnchor.constraint(equalTo: containerView.rightAnchor)
    ])
    //------------------------------------------------------------------------
    staly.textAlignment = .center
    staly.backgroundColor = .systemGray4
    staly.textColor = .label
    staly.font = .systemFont(ofSize: 20)
    staly.layer.cornerRadius = 10
    staly.clipsToBounds = true
    staly.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(staly)
    
    NSLayoutConstraint.activate([
      staly.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 10),
      staly.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      staly.heightAnchor.constraint(equalToConstant: 80),
      staly.widthAnchor.constraint(equalToConstant: 380),
    ])
    //------------------------------------------------------------------------
    nameBlogPage.textAlignment = .center
    nameBlogPage.backgroundColor = .systemGray4
    nameBlogPage.numberOfLines = 0
    nameBlogPage.textColor = .label
    nameBlogPage.font = .systemFont(ofSize: 20)
    nameBlogPage.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(nameBlogPage)
    
    NSLayoutConstraint.activate([
      nameBlogPage.topAnchor.constraint(equalTo: imageBlogPage.bottomAnchor, constant: 15),
      nameBlogPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      nameBlogPage.heightAnchor.constraint(equalToConstant: 70),
      nameBlogPage.widthAnchor.constraint(equalToConstant: 370)
    ])
    //------------------------------------------------------------------------
    staly2.font = UIFont.systemFont(ofSize: 18)
    staly2.numberOfLines = 0
    staly2.textColor = .label
    staly2.translatesAutoresizingMaskIntoConstraints = false
    staly2.backgroundColor = .systemGray4
    staly2.layer.cornerRadius = 10
    staly2.clipsToBounds = true
    containerView.addSubview(staly2)
    
    NSLayoutConstraint.activate([
      staly2.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 15),
      staly2.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      staly2.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -15),
      staly2.widthAnchor.constraint(equalToConstant: 370)
    ])
    //------------------------------------------------------------------------
    textBlogPage.backgroundColor = .systemGray4
    textBlogPage.textColor = .label
    textBlogPage.font = .systemFont(ofSize: 18)
    textBlogPage.numberOfLines = 12
    textBlogPage.textAlignment = .right
    textBlogPage.translatesAutoresizingMaskIntoConstraints = false
    containerView.addSubview(textBlogPage)
    
    NSLayoutConstraint.activate([
      textBlogPage.topAnchor.constraint(equalTo: nameBlogPage.bottomAnchor, constant: 25),
      textBlogPage.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor, constant: -25),
      textBlogPage.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      textBlogPage.widthAnchor.constraint(equalToConstant: 350)
    ])
  }
}
//--------------------------------------------------------------------------
