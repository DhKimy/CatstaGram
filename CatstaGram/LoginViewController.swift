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
    var userInfo: UserInfo?
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
        // Do any additional setup after loading the view.
    }

    @IBAction func emailTextFieldEditingChange(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.isVaildEmail() ? .facebookColor : .disabledButtonColor
        self.email = text
    }
    
    @IBAction func passwordFieldEditingChange(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.loginButton.backgroundColor = text.count > 2 ? .facebookColor : .disabledButtonColor
        self.password = text
    }
    
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입 정보를 전달받아서 그것과 텍스트 필드 데이터가 일치하면 로그인이 되어야 함.
        guard let userInfo = self.userInfo else { return }
        print(userInfo.email)
        print(self.email)
        print(userInfo.password)
        print(self.password)
        if userInfo.email == self.email && userInfo.password == self.password {
            let vc = storyboard?.instantiateViewController(withIdentifier: "TestVC") as! TestViewController
            self.present(vc, animated: true, completion: nil)
        } else {
        
        }
    }
    
    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        

        // 화면전환을 위한 부분 (스토리보드에서 직접 연결하지 않고 버튼 -> controller로 가도록 코드 작업하는 방법)

        // 1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // 2. 뷰컨트롤러를 생성
        let signupViewController = storyboard.instantiateViewController(withIdentifier: "SignupVC") as! SignupViewController

        //        // 3. 화면전환 메서드를 이용해 화면을 전환
        //        self.present(signupViewController, animated: true, completion: nil)

        self.navigationController?.pushViewController(signupViewController, animated: true)

        // 4. 데이터 수신을 위한 부분 (ARC 처리. 약한 참조로 진행)
        signupViewController.userInfo = { [weak self] (userInfo) in
            self?.userInfo = userInfo
        }
        
    }
    
    private func setupAttribute() {
        // registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.systemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.signupButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.signupButton.setAttributedTitle(attributes, for: .normal)

    }
}
