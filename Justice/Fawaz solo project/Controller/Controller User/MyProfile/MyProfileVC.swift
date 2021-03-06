//
//  MyProfileVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 27/11/2021.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class MyProfileVC: UIViewController {
  
  //-------------------------------------------------------------------------
  override func viewDidLoad () {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    allConstraint()
    
    guard let currentUserID = Auth.auth().currentUser?.uid else {return}
    RegisterServiceUser.shared.listenToUsers { ubdateUser in
      self.users = ubdateUser
    }
    
    title = "More"

    let singOut = UIButton()
    singOut.setImage(UIImage(systemName: "power"), for: .normal)
    singOut.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    singOut.layer.cornerRadius = 8
    singOut.clipsToBounds = true
    singOut.translatesAutoresizingMaskIntoConstraints = false
    singOut.addTarget(self, action: #selector(singOutButtonTapped), for: .touchUpInside)
    navigationItem.rightBarButtonItem = UIBarButtonItem(
      customView: singOut
    )
  }
  //-------------------------------------------------------------------------
  var users: Array<User> = []
  //-------------------------------------------------------------------------
  lazy var TV: UITableView = {
    let TV = UITableView()
    TV.dataSource = self
    TV.delegate = self
    TV.rowHeight = 80
    TV.translatesAutoresizingMaskIntoConstraints = false
    TV.register(MyProfileVC_Cell.self, forCellReuseIdentifier: MyProfileVC_Cell.identifier)
    return TV
  }()
  //-------------------------------------------------------------------------
  lazy var singOutButton: UIButton = {
    let buttonSingOut = UIButton(type: .system)
    buttonSingOut.setTitle(NSLocalizedString("singOut", comment: ""), for: .normal)
    buttonSingOut.setTitleColor(.red, for: .normal)
    buttonSingOut.translatesAutoresizingMaskIntoConstraints = false
    buttonSingOut.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
    buttonSingOut.addTarget(self, action: #selector(singOutButtonTapped), for: .touchUpInside)
    return buttonSingOut
  }()
  //-------------------------------------------------------------------------
  func allConstraint(){
    
    view.addSubview(TV)
    NSLayoutConstraint.activate([
      TV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      TV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      TV.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      TV.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
  }
}
//---------------------------------------------------------------------------
extension MyProfileVC: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data_MyProfile_str.count
  }
  //-------------------------------------------------------------------------
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = data_MyProfile_str[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: MyProfileVC_Cell.identifier, for: indexPath) as! MyProfileVC_Cell
    cell.imageCell.image = list.image
    cell.titleCell.text = list.title
    cell.textCell.text = list.text
    cell.stalyCell.text = list.text
    return cell
  }
  //-------------------------------------------------------------------------
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.reloadData()
    
    let data4 = data_MyProfile_str[indexPath.row]
    
    let VC4_MyProfileVC = MyProfilePageVC()
    VC4_MyProfileVC.imageMyProfilePage.image = data4.image
    VC4_MyProfileVC.nameMyProfilePage.text = data4.text
    VC4_MyProfileVC.numberMyProfilePage.text = data4.title
    VC4_MyProfileVC.textMyProfilePage.text = data4.text
    navigationController?.pushViewController(VC4_MyProfileVC, animated: false)
  }
  //-------------------------------------------------------------------------
  //sing out
  @objc private func singOutButtonTapped(sender: UIButton!) {
    
    let alert = UIAlertController(title: "Do you want to log out?",
                                  message: "",
                                  preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
      self.dismiss(animated: true, completion: nil)}))
    
    alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: { action in
      print("Do not log out")}))
    
    self.present(alert, animated: true)
    
  }
  
  @objc private func openConversation(sender: UIButton!) {
    
    self.present(ChatVC(), animated: true)
    
  }
}
//--------------------------------------------------------------------------
