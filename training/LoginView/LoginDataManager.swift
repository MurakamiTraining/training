//
//  LoginDataManager.swift
//  training
//
//  Created by 村上拓也 on 2024/10/31.
//

import Foundation

/// - Description:
/// RSS記事の管理（お気に入り登録、記事のキャッシュなど）
class LoginDataManager {
    // シングルトン定義
    public static let shared = LoginDataManager()
    private var userId: String = ""
    private var password: String = ""
    private var alreadyLogin: Bool = false
    private var appleId: String = ""
    
    /// - Description:
    ///　シングルトン初期化
    /// - Parameters:
    /// - Returns:
    private init() {
        loadData()
    }
    /// - Description:
    /// UserDefaultsの読み込み
    /// - Parameters:
    /// - Returns:
    private func loadData() {
        userId = UserDefaults.standard.string(forKey: ProjectConstant.userIdKey) ?? ""
        password = UserDefaults.standard.string(forKey: ProjectConstant.passwordKey) ?? ""
        alreadyLogin = UserDefaults.standard.bool(forKey: ProjectConstant.alreadyLoginKey)
        appleId = UserDefaults.standard.string(forKey: ProjectConstant.appleUserIdKey) ?? ""
    }
    
    /// - Description:
    ///　UserIdを取得
    /// - Parameters:
    /// - Returns:
    ///     - userId
    public func getUserId() -> String {
        return userId
    }
    
    /// - Description:
    ///　Passwordを取得
    /// - Parameters:
    /// - Returns:
    ///     - password
    public func getPassword() -> String {
        return password
    }
    
    /// - Description:
    ///　ログイン中か判定
    /// - Parameters:
    /// - Returns:
    ///     - ログイン状態
    public func isLogin() -> Bool {
        return alreadyLogin
    }
    
    /// - Description:
    ///AppleIdを取得
    /// - Parameters:
    /// - Returns:
    ///     - AppleId
    public func getAppleId() -> String {
        return appleId
    }
    
    /// - Description:
    /// ログイン状態を設定
    /// - Parameters:
    ///   - isLogin: Bool
    /// - Returns:
    public func setLoginState(isLogin: Bool) {
        alreadyLogin = isLogin
        UserDefaults.standard.set(isLogin, forKey: ProjectConstant.alreadyLoginKey)
    }
    
    /// - Description:
    /// UserId
    /// - Parameters:
    ///   - isLogin: Bool
    /// - Returns:
    public func setUserId(userId: String) {
        self.userId = userId
        UserDefaults.standard.set(userId, forKey: ProjectConstant.userIdKey)
    }
    
    /// - Description:
    /// ログイン状態を設定
    /// - Parameters:
    ///   - isLogin: Bool
    /// - Returns:
    public func setPassword(password: String) {
        self.password = password
        UserDefaults.standard.set(password, forKey: ProjectConstant.passwordKey)
    }
    
    /// - Description:
    /// ログイン状態を設定
    /// - Parameters:
    ///   - isLogin: Bool
    /// - Returns:
    public func setAppleId(appleId: String) {
        self.appleId = appleId
        UserDefaults.standard.set(appleId, forKey: ProjectConstant.appleUserIdKey)
    }
}
