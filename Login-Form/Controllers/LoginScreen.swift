//
//  LoginScreenViewController.swift
//  Login-Form
//
//  Created by Dimitrios Gkarlemos on 27/01/2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices
import CryptoKit


class LoginScreen: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var arrow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrow.layer.cornerRadius = 12.5
        
        
    }
    
    @IBAction func signinButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                if Auth.auth().currentUser?.isEmailVerified == false {
                    let alert = UIAlertController(title: "Something went wrong", message: "Please verify your email in order to proceed", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: "SigninToMain", sender: self)
                }
            }
        }
    }
    
    
    @IBAction func googleButtonPressed(_ sender: UIButton) {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error {
              print(error.localizedDescription)
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)

            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error {
                    print(error.localizedDescription)
                } else {
                    print("Successful Sign in !")
                    self.performSegue(withIdentifier: "SigninToMain", sender: self)
                }
            }
        }
    }
    
    @IBAction func appleButtonPressed(_ sender: UIButton) {
        // Button is not functional yet...
  }
    
}
