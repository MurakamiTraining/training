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
        
        
    }
    
    // ユーザーID入力後
    @IBAction func inputUserIdDidEnd() {
        
        
    }
    
    // パスワード入力後
    @IBAction func inputPasswordDidEnd() {
        
        
    }
    
    // ログインボタン押下
    @IBAction func buttonLoginDidTap() {
        
        moveNextView(storyboardID: .Main)
    }

    // 新規ユーザー登録ボタン押下後
    @IBAction func buttonSignupDidTap() {
        
        moveNextView(storyboardID: .Main)
    }
}
