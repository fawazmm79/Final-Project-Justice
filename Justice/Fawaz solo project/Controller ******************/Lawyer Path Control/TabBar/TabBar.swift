//
//  TabBar.swift
//  Fawaz solo project
//
//  Created by Fawaz on 12/12/2021.
//

import UIKit

class TabLawyer: UITabBarController {
  
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    UITabBar.appearance().barTintColor = .systemBackground
    
    tabBar.tintColor = .label
    
    setupVCs()
  }
  //--------------------------------------------------------------------------
  fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
    
    let navController = UINavigationController(rootViewController: rootViewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = image
    
    rootViewController.navigationItem.title = title
    
    return navController
  }
  //--------------------------------------------------------------------------
  func setupVCs() {
    
    viewControllers = [
      
      createNavController(
        for:D(),
           title: NSLocalizedString("fffff", comment: ""),
           image: UIImage(systemName: "square.grid.2x2")!),
      
      createNavController(
        for:CourtVC(),
           title: NSLocalizedString("الخدمات الإلكترونيه", comment: ""),
           image: UIImage(systemName: "square.grid.2x2")!),
      
      createNavController(
        for:LawyersVC (),
           title: NSLocalizedString("المحامين", comment: ""),
           image: UIImage(systemName: "person.2.crop.square.stack")!),
      
      createNavController(
        for:NewsVC (),
           title: NSLocalizedString("اخبار", comment: ""),
           image: UIImage(systemName: "newspaper")!),
      
      createNavController(
        for:MapVC (),
           title: NSLocalizedString("الموقع", comment: ""),
           image: UIImage(systemName: "location")!),
      
      createNavController(
        for:MyProfileVC(),
           title: NSLocalizedString("المزيد", comment: ""),
           image: UIImage(systemName: "text.justify")!),
    ]
    
    let dictionary = [
      
      1:"CourtVC",
      2:"LawyersVC",
      3:"NewsVC",
      4:"MapVC",
      5:"MyProfileVC"
    ]
    print(dictionary[2] ?? "CourtVC")
    
    let sett: Set<String> = ["CourtVC" , "LawyersVC" ,"NewsVC" ,"MapVC" ,"MyProfileVC"]
    print(sett)
    
  }
}
//--------------------------------------------------------------------------