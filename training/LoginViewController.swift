//
//  LoginViewController.swift
//  training
//
//  Created by 村上拓也 on 2024/09/05.
//

import UIKit

class LoginViewController: ViewControllerExtension {
    // 画面読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // ユーザーID入力後
    @IBAction func inputEndUserId() {
    }
    
    // パスワード入力後
    @IBAction func inputEndPassword() {
    }
    
    // ログインボタン押下
    @IBAction func onTapLoginButton() {
        moveNextView(storyboardID: .RSSFeedList)
    }

    // 新規ユーザー登録ボタン押下後
    @IBAction func onTapSignupButton() {
        moveNextView(storyboardID: .RSSFeedList)
    }
}
