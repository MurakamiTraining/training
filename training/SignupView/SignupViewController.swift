//
//  SignupViewController.swift
//  training
//
//  Created by 村上拓也 on 2024/09/05.
//

import UIKit

class SignupViewController: UIViewController {
    // UIデータのアウトレット接続
    @IBOutlet weak var userIdInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var cautionLabel: UILabel!
    
    // ユーザーId
    var userId: String = ""
    // パスワード
    var password: String = ""
    
    // 画面読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // 新規ユーザー登録ボタン押下後
    @IBAction func onTapSignupButton() {
        userIdInput.endEditing(true)
        passwordInput.endEditing(true)
        // エラー処理
        if userId == "" {
            cautionLabel.text = "ユーザーIDを入力してください"
            return
        } else if password == "" {
            cautionLabel.text = "パスワードを入力してください"
            return
        }
        // ID、パスワードを保存しメインのシーンへ
        UserDefaults.standard.set(userId, forKey: ProjectConstant.userIdKey)
        UserDefaults.standard.set(password, forKey: ProjectConstant.passwordKey)
        navigationController?.moveNextView(storyboardID: .RSSSelect)
    }
    
    // ユーザーID入力後
    @IBAction func onEditingEndUserId() {
        guard let userId = userIdInput.text else { return }
        self.userId = userId
    }
    
    // パスワード入力後
    @IBAction func onEditingEndPassword() {
        guard let password = passwordInput.text else { return }
        self.password = password
    }
}
