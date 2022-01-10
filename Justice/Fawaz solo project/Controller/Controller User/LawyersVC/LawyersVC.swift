//
//  LawyersVC.swift
//  Fawaz solo project
//
//  Created by Fawaz on 28/11/2021.
//

import UIKit

class LawyersVC: UIViewController {
  
  //--------------------------------------------------------------------------
  override func viewDidLoad(){
    super.viewDidLoad()
    
    view.backgroundColor = UIColor (named: "myBackgroundColor")
    
    allConstraint()
    configureUI()
    
    TV.dataSource = self
    TV.delegate = self
  }
  //--------------------------------------------------------------------------
  let searchBar = UISearchBar()
  var users = data_Lawyers_str
  var search = false
  
  //  var SearchBar: UISearchBar!
  
  //  var ProductsVC: UICollectionView!
  
  //  var searchedProducts = data_Lawyers_str
  //--------------------------------------------------------------------------
  lazy var TV: UITableView = {
    let TV = UITableView()
    TV.translatesAutoresizingMaskIntoConstraints = false
    TV.dataSource = self
    TV.delegate = self
    TV.rowHeight = 100
    TV.register(LawyersVC_Cell.self, forCellReuseIdentifier: LawyersVC_Cell.identifier)
    return TV
  }()
  //--------------------------------------------------------------------------
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
//--------------------------------------------------------------------------
extension LawyersVC: UISearchBarDelegate {
  
  @objc func handleShowSearchBar(){
    search(shouldShow: true)
    searchBar.becomeFirstResponder()
  }
  //--------------------------------------------------------------------------
  func configureUI(){
    
    searchBar.sizeToFit()
    searchBar.delegate = self
    showSearchBarButton(shouldShow:true)
  }
  //--------------------------------------------------------------------------
  func showSearchBarButton (shouldShow: Bool){
    if shouldShow {
      navigationItem.rightBarButtonItem=UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
    } else {
      navigationItem.rightBarButtonItem=nil
    }
  }
  //--------------------------------------------------------------------------
  func search (shouldShow: Bool) {
    showSearchBarButton (shouldShow: !shouldShow)
    searchBar.showsCancelButton = shouldShow
    navigationItem.titleView = shouldShow ? searchBar : nil
  }
  //--------------------------------------------------------------------------
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar){
    print("Search bar did begin editing..")
  }
  //--------------------------------------------------------------------------
  func searchBarTextDidEndEditing(_searchBar: UISearchBar){
    print("Search bar did end editing..")
  }
  //--------------------------------------------------------------------------
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
    search(shouldShow: false)
    search = false
    users = data_Lawyers_str
  }
  //--------------------------------------------------------------------------
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.isEmpty {
      users = data_Lawyers_str
    } else{
      users = data_Lawyers_str.filter({i in
        return i.name.lowercased().starts(with: searchText.lowercased())
      })
    }
    TV.reloadData()
  }
}
//--------------------------------------------------------------------------
extension LawyersVC: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return users.count
  }
  //--------------------------------------------------------------------------
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let list = users[indexPath.row]
    
    let cell = tableView.dequeueReusableCell(withIdentifier: LawyersVC_Cell.identifier, for: indexPath) as! LawyersVC_Cell
    cell.imageCell.image = list.image
    cell.nameCell.text = list.name
    
    return cell
  }
  //--------------------------------------------------------------------------
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    TV.reloadData()
    
    let data3 = users[indexPath.row]
    
    let VC3_LawyersPageVC = LawyersPageVC()
    VC3_LawyersPageVC.imageLawyersPage.image = data3.image
    VC3_LawyersPageVC.nameLawyersPage.text = data3.name
    VC3_LawyersPageVC.numberLawyersPage.text = data3.number
    VC3_LawyersPageVC.textLawyersPage.text = data3.text
    navigationController?.pushViewController(VC3_LawyersPageVC, animated: true)
  }
}
//------------------------------------------------------------------------
