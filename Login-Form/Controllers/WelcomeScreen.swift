//
//  ViewController.swift
//  Login-Form
//
//  Created by Dimitrios Gkarlemos on 27/01/2023.
//

import UIKit

class WelcomeScreen: UIViewController {
    
    @IBOutlet weak var buttonsView: UIStackView!
    @IBOutlet weak var registerButtonView: UIButton!
    @IBOutlet weak var signinButtonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        buttonsView.layer.cornerRadius = 25
        buttonsView.layer.borderWidth = 0.5
        buttonsView.layer.borderColor = UIColor.white.cgColor
        
        registerButtonView.layer.cornerRadius = 25
        signinButtonView.layer.cornerRadius = 25
    }
}

