//
//  LoginViewController.swift
//  CatstaGram
//
//  Created by 김동현 on 2022/12/29.
//

import UIKit

class LoginViewController: UIViewController {

    var email = String()
    var password = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func emailTextFieldEditingChange(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChange(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
    }
    
    @IBAction func signupButtonDidTap(_ sender: UIButton) {
    }
    
    
}
