//
//  TabVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit
protocol fawaz{
  
}
class TabVC: UITabBarController,fawaz {
  
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
//    UITabBar.appearance().barTintColor = .systemBackground
    
    tabBar.tintColor = .orange
    tabBar.backgroundColor = UIColor(named: "myBackgroundColor")
    
    setupVCs()
    
    
//
//    let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
//        swipeLeft.direction = .left
//        self.view.addGestureRecognizer(swipeLeft)
//
//    let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
//        swipeRight.direction = .right
//        self.view.addGestureRecognizer(swipeRight)
//
////        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
////        swipeUp.direction = .up
////        self.view.addGestureRecognizer(swipeUp)
////
////        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
////        swipeDown.direction = .down
////        self.view.addGestureRecognizer(swipeDown)
//
//}
//
//    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
//       if gesture.direction == .right {
//           present(
//               UINavigationController(rootViewController: CourtVC()),
//               animated: true,
//               completion: nil
//           )
//       }
//       else if gesture.direction == .left {
//
//               present(
//                   UINavigationController(rootViewController: LawyersVC()),
//                   animated: true,
//                   completion: nil)
//
//       }
//       else if gesture.direction == .up {
//            print("Swipe Up")
//       }
//       else if gesture.direction == .down {
//            print("Swipe Down")
//       }
    }
    
    
    
  //--------------------------------------------------------------------------
  fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
    
    let navController = UINavigationController(rootViewController: rootViewController)
    navController.tabBarItem.title = title
    navController.tabBarItem.image = image
//    navController.navigationBar.backgroundColor = UIColor(named: "myBackgroundColor")
    
    rootViewController.navigationItem.title = title
    
    return navController
  }
  //--------------------------------------------------------------------------
  func setupVCs() {
    
    viewControllers = [
      
      createNavController(
        for:ChatVC(),
           title: NSLocalizedString("Chat", comment: ""),
           image: UIImage(systemName: "square.grid.2x2")!),
            
      createNavController(
        for:CourtVC(),
           title: NSLocalizedString("Categories", comment: ""),
           image: UIImage(systemName: "square.grid.2x2")!),
      
      createNavController(
        for:LawyersVC (),
           title: NSLocalizedString("Lawyers", comment: ""),
           image: UIImage(systemName: "person.2.crop.square.stack")!),
      
      createNavController(
        for:NewsVC (),
           title: NSLocalizedString("News", comment: ""),
           image: UIImage(systemName: "newspaper")!),
      
      createNavController(
        for:MapVC (),
           title: NSLocalizedString("Location", comment: ""),
           image: UIImage(systemName: "location")!),
      
      createNavController(
        for:MyProfileVC(),
           title: NSLocalizedString("More", comment: ""),
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
