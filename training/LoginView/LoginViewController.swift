//
//  LoginViewController.swift
//  training
//
//  Created by 村上拓也 on 2024/09/05.
//

import UIKit
import AuthenticationServices
import FirebaseAuth
import FirebaseAuthUI
import FirebaseGoogleAuthUI

class LoginViewController: UIViewController {
    // UIデータのアウトレット接続
    @IBOutlet weak var loginLabel: UILabel!
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
        // ログイン済み判定
        let alreadyLogin = UserDefaults.standard.bool(forKey: ProjectConstant.alreadyLoginKey)
        if alreadyLogin {
            // RSSフィードリスト画面へ移動
            DispatchQueue.main.async {
                self.navigationController?.moveNextView(storyboardID: .RSSSelect)
            }
            return
        }
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let appleUserId = UserDefaults.standard.string(forKey: ProjectConstant.appleUserIdKey) ?? ""
        appleIDProvider.getCredentialState(forUserID: appleUserId) { (creditialState, error) in
            switch creditialState {
                case .authorized:
                    // RSSフィードリスト画面へ移動
                    DispatchQueue.main.async {
                        self.navigationController?.moveNextView(storyboardID: .RSSSelect)
                    }
                    return
                case .revoked, .notFound:
                    break
                default:
                    break
            }
        }
        // Appleログインボタン設定
        let authorizationButton = ASAuthorizationAppleIDButton()
        authorizationButton.addTarget(self, action: #selector(onTapAppleLoginButton), for: .touchUpInside)
        authorizationButton.layer.position.y = self.view.frame.midY - 100
        authorizationButton.layer.position.x = self.view.frame.midX
        self.view.addSubview(authorizationButton)
        // 警告ラベルの初期化
        cautionLabel.text = ""
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
    
    // ログインボタン押下
    @IBAction func onTapLoginButton() {
        // ユーザーID、パスワード取得
        let defaultUserId = UserDefaults.standard.string(forKey: ProjectConstant.userIdKey)
        let defaultPassword = UserDefaults.standard.string(forKey: ProjectConstant.passwordKey)
        userIdInput.endEditing(true)
        passwordInput.endEditing(true)
        // ログイン処理
        if (defaultUserId == userId) && (defaultPassword == password) {
            cautionLabel.text = ""
            UserDefaults.standard.set(true, forKey: ProjectConstant.alreadyLoginKey)
            navigationController?.moveNextView(storyboardID: .RSSSelect)
        } else if userId == "" {
            cautionLabel.text = "ユーザーIDを入力してください"
        } else if password == "" {
            cautionLabel.text = "パスワードを入力してください"
        } else if (defaultUserId != userId) || (defaultPassword != password) {
            cautionLabel.text = "ユーザーID/パスワードが間違っています"
        } else {
            cautionLabel.text = "ログインエラー"
        }
    }
    
    // Googleでログインボタン押下後
    @IBAction func onTapGoogleButton() {
        // Googleログインボタン設定
        guard let authUI = FUIAuth.defaultAuthUI() else { return }
        authUI.delegate = self
        let googleAuthProvider = FUIGoogleAuth(authUI: authUI)
        let providers: [FUIAuthProvider] = [ googleAuthProvider ]
        authUI.providers = providers
        authUI.shouldHideCancelButton = true
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }

    // 新規ユーザー登録ボタン押下後
    @IBAction func onTapSignupButton() {
        navigationController?.moveNextView(storyboardID: .Signup)
    }
}

/// - Description:
/// Login画面のAppleログイン処理関連
extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    // ユーザー認証情報の処理
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential{
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                let userIdentifier = appleIDCredential.user
                // サインイン時のIDを保存
                UserDefaults.standard.set(userIdentifier, forKey: ProjectConstant.appleUserIdKey)
                navigationController?.moveNextView(storyboardID: .RSSSelect)
            
            default:
                break
        }
    }
    // Appleログインボタン押下
    @IBAction func onTapAppleLoginButton() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    // Appleログインウィンドウの表示
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

/// - Description:
/// Login画面のGoogleログイン処理関連
extension LoginViewController: FUIAuthDelegate {
    // Googleアカウント認証結果
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if let _ = user {
            navigationController?.moveNextView(storyboardID: .RSSSelect)
        }
        else {
            // ログイン失敗処理
        }
    }
}
