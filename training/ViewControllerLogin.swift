//
//  ViewControllerLogin.swift
//  training
//
//  Created by 村上拓也 on 2024/09/05.
//

import UIKit

class ViewControllerLogin: ViewControllerExtension {

    // 画面読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色変更
        view.backgroundColor = UIColor.white
        
        // タイトルラベル
        let labelTitle = UILabel()
        let labelTitleWidth: CGFloat = 300
        let labelTitleHeight: CGFloat = 80
        
        labelTitle.text = "RSSリーダー"
        labelTitle.frame = CGRect(x: self.view.frame.width/2 - 150, y: self.view.frame.height/2 - 200, width: labelTitleWidth, height: labelTitleHeight)
        labelTitle.textAlignment = NSTextAlignment.center
        
        self.view.addSubview(labelTitle)
        
        // ユーザーID入力フィールド
        let userIdField = UITextField()
        userIdField.frame = CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 - 70, width: 200, height: 50)
        userIdField.backgroundColor = UIColor.gray
        userIdField.returnKeyType = UIReturnKeyType.done
        userIdField.placeholder = "Enter user id..."
        userIdField.delegate = self
        userIdField.addTarget(self, action: #selector(inputUserIdDidEnd), for: .editingDidEnd)
        
        self.view.addSubview(userIdField)
        
        // パスワード入力フィールド
        let passwordField = UITextField()
        passwordField.frame = CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2, width: 200, height: 50)
        passwordField.backgroundColor = UIColor.gray
        passwordField.returnKeyType = UIReturnKeyType.done
        passwordField.placeholder = "Enter password..."
        passwordField.delegate = self
        passwordField.addTarget(self, action: #selector(inputPasswordDidEnd), for: .editingDidEnd)
        
        self.view.addSubview(passwordField)
        
        // ログインボタン
        let buttonLogin = UIButton()
        
        buttonLogin.setTitle("Login", for: .normal)
        buttonLogin.frame = CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 + 100, width: 200, height: 50)
        buttonLogin.backgroundColor = UIColor.blue
        buttonLogin.addTarget(self, action: #selector(buttonLoginDidTap), for: .touchUpInside)
        
        self.view.addSubview(buttonLogin)
        
        // 新規ユーザー登録ボタン
        let buttonSignup = UIButton()
        
        buttonSignup.setTitle("Signup", for: .normal)
        buttonSignup.frame = CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height/2 + 200, width: 200, height: 50)
        buttonSignup.backgroundColor = UIColor.orange
        buttonSignup.addTarget(self, action: #selector(buttonSignupDidTap), for: .touchUpInside)
        
        self.view.addSubview(buttonSignup)
    }
    
    // ユーザーID入力後
    @IBAction func inputUserIdDidEnd() {
        
        
    }
    
    // パスワード入力後
    @IBAction func inputPasswordDidEnd() {
        
        
    }
    
    // ログインボタン押下
    @IBAction func buttonLoginDidTap() {
        
        ViewControllerManager.shared.moveNextView(currentVC: self, nextVC: ViewControllerMain())
    }

    // 新規ユーザー登録ボタン押下後
    @IBAction func buttonSignupDidTap() {
        
        ViewControllerManager.shared.moveNextView(currentVC: self, nextVC: ViewControllerSignup())
    }
}

// 入力フィールド処理を拡張
extension ViewControllerLogin: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
