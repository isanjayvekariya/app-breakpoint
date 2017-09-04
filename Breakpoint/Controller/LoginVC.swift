//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Sanjay Vekariya on 9/3/17.
//  Copyright © 2017 Sanjay Vekariya. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailFieild: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailFieild.delegate = self
        passwordField.delegate = self

    }
    @IBAction func signInBtnPressed(_ sender: Any) {
        guard let email = emailFieild.text, let password = passwordField.text else { return }
        AuthService.instance.userLogin(withEmail: email, andPassword: password) { (success, loginErr) in
            if success {
                self.dismiss(animated: true, completion: nil)
            } else {
                print(String(describing: loginErr?.localizedDescription))
            }
            
            AuthService.instance.registerUser(withEmail: email, andPassword: password, userCreationComplete: { (success, registrationErr) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                    print("Successfully registered user!")
                } else {
                    print(String(describing: registrationErr?.localizedDescription))
                }
            })
        }
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate {
    
}
