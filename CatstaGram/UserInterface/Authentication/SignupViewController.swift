//
//  SignupViewController.swift
//  CatstaGram
//
//  Created by 김동현 on 2022/12/29.
//

import UIKit

class SignupViewController: UIViewController {

    // MARK: - Properties
    var email: String = ""
    var name: String = ""
    var nickname: String = ""
    var password: String = ""
    
    var userInfo: ((UserInfo) -> Void)?
    
    // 유효성 검사를 위한 프로퍼티
    var isValidEmail = false {
        didSet { // 세팅이 되고 난 후에 코드블럭을 실행
            self.validateUserInfo()
        }
    }
    var isValidName = false{
        didSet { // 세팅이 되고 난 후에 코드블럭을 실행
            self.validateUserInfo()
        }
    }
    
    var isValidNickname = false{
        didSet { // 세팅이 되고 난 후에 코드블럭을 실행
            self.validateUserInfo()
        }
    }
    
    var isValidPassword = false{
        didSet { // 세팅이 되고 난 후에 코드블럭을 실행
            self.validateUserInfo()
        }
    }
    
    // MARK: - TextField
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var popToLoginButton: UIButton!
    
    // 연산프로퍼티로 텍스트 필드에 순차적으로 접근할 수 있도록 함
    var textField: [UITextField] {
        [emailTextField, nameTextField, nicknameTextField, passwordTextField]
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
        setupAttribute()
        
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    
    // MARK: - Actions
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isVaildEmail()
            self.email = text
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        case nicknameTextField:
            self.isValidNickname = text.count > 2
            self.nickname = text
        case passwordTextField:
            self.isValidPassword = text.isVaildPassword()
            self.password = text
            print("password")
        default:
            fatalError("텍스트 필드 존재하지 않음")
        }
    }
    
    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
        
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickname: self.nickname,
            password: self.password
        )
        self.userInfo?(userInfo)
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Helpers
    // 입력되는 곳이 어딘지를 알려주는 용도
    private func setupTextField() {
        textField.forEach({ tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        })
    }
    
    // 사용자가 입력한 회원정보를 확인하고 UI 업데이트
    private func validateUserInfo() {
        
        if isValidEmail && isValidName && isValidNickname && isValidPassword {
            self.signupButton.isEnabled = true
            // 애니메이션 추가하는 것
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebookColor
                self.signupButton.tintColor = UIColor.white
            }
        } else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.tintColor = UIColor.white
                self.signupButton.backgroundColor = UIColor.disabledButtonColor
                
            }
        }
        
    }
    
    private func setupAttribute() {
        // registerButton
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.systemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1, text2,
            fonts: font1, font2,
            colors: color1, color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)

    }
    
}

// 정규표현식 기능확장
extension String {
    // 대문자, 소문자, 특수문자, 숫자 확인. 8자 이상일 때 True를 리턴함.
    func isVaildPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @를 포함하는지, 2글자 이상인지
    func isVaildEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailTest.evaluate(with: self)
    }
}
