//
//  File.swift
//  Fawaz solo project
//
//  Created by Fawaz on 12/12/2021.
//

import UIKit
import FirebaseFirestore

class RegisterServiceLawyer {
  
  static let shared = RegisterServiceLawyer()
  
  let lawyersCollection = Firestore.firestore().collection("lawyers")
  //-------------------------------------------------------------------------
  // Add user to firestor//computed properties
  func addLawyer(lawyer: Lawyer) {
    lawyersCollection.document(lawyer.id).setData(lawyer.dictLawyer)
  }
  //-------------------------------------------------------------------------
  func listenToLawyers(completion: @escaping (([Lawyer]) -> Void)) {
    
    lawyersCollection.addSnapshotListener { snapshot, error in
      if error != nil {
        return
      }
      guard let documents = snapshot?.documents else { return }
      
      var lawyers: Array<Lawyer> = []
      for document in documents {
        let data = document.data()
        let lawyer = Lawyer(
          id: (data["id"] as? String) ?? "No id",
          name: (data["name"] as? String) ?? "No name",
          image: (data["image"] as? String) ?? "no image",
          latitude: (data["latitude"] as? Double) ?? 0.0,
          longitude: (data["longitude"] as? Double) ?? 0.0
        )
        lawyers.append(lawyer)
      }
      
      completion(lawyers)
    }
  }
  //-------------------------------------------------------------------------
  func updateUserInfo(lawyer: Lawyer) {
    lawyersCollection.document(lawyer.id).setData([
      "id": lawyer.id,
      "name": lawyer.name
    ], merge: true)
  }
  
}
//--------------------------------------------------------------------------
