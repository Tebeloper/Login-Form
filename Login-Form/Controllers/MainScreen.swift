//
//  MainScreenViewController.swift
//  Login-Form
//
//  Created by Dimitrios Gkarlemos on 27/01/2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseDatabase

class MainScreen: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        getData()
    }
    
//    func getData() {
//        let userID = Auth.auth().currentUser?.uid
//        let userEmail = Auth.auth().currentUser?.email
//        let user = Users(uid: userID!, email: userEmail!)
//
//        mail.text = "\(user.email)"
//    }
}
