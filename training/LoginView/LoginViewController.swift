//
//  LoginViewController.swift
//  training
//
//  Created by 村上拓也 on 2024/09/05.
//

import UIKit

class LoginViewController: UIViewController {
    // 画面読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ユーザーID入力後
    @IBAction func onEditingEndUserId() {
    }
    
    // パスワード入力後
    @IBAction func onEditingEndPassword() {
    }
    
    // ログインボタン押下
    @IBAction func onTapLoginButton() {
        navigationController?.moveNextView(storyboardID: .RSSFeedList)
    }

    // 新規ユーザー登録ボタン押下後
    @IBAction func onTapSignupButton() {
        navigationController?.moveNextView(storyboardID: .RSSFeedList)
    }
}
