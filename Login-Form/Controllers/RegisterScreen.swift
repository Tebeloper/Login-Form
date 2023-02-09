//
//  RegisterScreenViewController.swift
//  Login-Form
//
//  Created by Dimitrios Gkarlemos on 27/01/2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class RegisterScreen: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var arrow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrow.layer.cornerRadius = 12.5
    }
    
    @IBAction func createButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text, let surname = surnameTextField.text {
            
            Auth.auth().createUser(withEmail: email, password: password) {authResult, error in
                if let error {
                    
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["name": name, "surname": surname, "uid": authResult!.user.uid, "email": email]) { (error) in
                        if let error {
                            print(error.localizedDescription)
                        }
                        
                        let alert = UIAlertController(title: " A verification Email Send", message: "Please check your email for a verification code in order to continue...", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                    // email verification
                    Auth.auth().currentUser?.sendEmailVerification { error in
                        if let error {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}
