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
        
                // 화면전환을 위해서는... (스토리보드에서 직접 연결하지 않고 버튼 -> controller로 가도록 코드 작업하는 방법)
        
                // 1. 스토리보드를 생성
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
                // 2. 뷰컨트롤러를 생성
                let signupViewController = storyboard.instantiateViewController(withIdentifier: "SignupVC") as! SignupViewController
        
        //        // 3. 화면전환 메서드를 이용해 화면을 전환
        //        self.present(signupViewController, animated: true, completion: nil)
        
                self.navigationController?.pushViewController(signupViewController, animated: true)
        
        
    }
}
