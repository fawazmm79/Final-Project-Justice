//
//  LawyersVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import UIKit

class LawyersVC: UIViewController {
  
  var searchBar = UISearchBar()
  
  //--------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    let TV = UITableView()
    
    TV.dataSource = self
    TV.delegate = self
    TV.register(LawyersVC_Cell.self, forCellReuseIdentifier: LawyersVC_Cell.identifier)
    TV.rowHeight = 100
    TV.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(TV)
    
    NSLayoutConstraint.activate([
      TV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      TV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      TV.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      TV.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
    ])
    configureSearchBar()
  }
  //--------------------------------------------------------------------------
  @objc func handleShowSearchBar(){
    navigationItem.titleView = searchBar
  }
  //--------------------------------------------------------------------------
  func configureSearchBar(){
    
    searchBar.sizeToFit()
    navigationController?.navigationBar.barTintColor = UIColor(red:55/255, green:120/255, blue: 250/255,alpha: 1)
    navigationController?.navigationBar.isTranslucent = false
    navigationItem.rightBarButtonItem=UIBarButtonItem(barButtonSystemItem: .search, target: self,action: #selector (handleShowSearchBar))
  }
}
//--------------------------------------------------------------------------
extension LawyersVC: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return data_Lawyers_str.count
  }
  //--------------------------------------------------------------------------
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = data_Lawyers_str[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: LawyersVC_Cell.identifier, for: indexPath) as! LawyersVC_Cell
    cell.imageCell.image = list.image
    cell.nameCell.text = list.name
    
    return cell
  }
  //--------------------------------------------------------------------------
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    tableView.reloadData()
    
    let data3 = data_Lawyers_str[indexPath.row]
    
    let VC3_LawyersPageVC = LawyersPageVC()
    VC3_LawyersPageVC.imageBlogPage.image = data3.image
    VC3_LawyersPageVC.nameBlogPage.text = data3.name
    VC3_LawyersPageVC.numberBlogePage.text = data3.number
    VC3_LawyersPageVC.textBlogPage.text = data3.text
    navigationController?.pushViewController(VC3_LawyersPageVC, animated: true)
  }
  
}
//--------------------------------------------------------------------------
