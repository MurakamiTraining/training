//
//  ManagerRSS.swift
//  training
//
//  Created by 村上拓也 on 2024/10/04.
//

import Foundation

/// - Description:
/// RSS記事の管理（お気に入り登録、記事のキャッシュなど）
class ManagerRSS {
    
    public static let shared = ManagerRSS()
    
    var favoriteFeed:Array<String> = []
    
    // シングルトン初期化
    private init() {
        
        loadData()
    }
    
    /// - Description:
    ///　保存データの読み込み
    /// - Parameters:
    /// - Returns:
    public func loadData() {
        
        favoriteFeed = UserDefaults.standard.stringArray(forKey: ConstantTraining.FavoriteFeedKey) ?? favoriteFeed
    }
    
    /// - Description:
    ///　お気に入りを保存
    /// - Parameters:
    ///     - id: 記事のID
    /// - Returns:
    public func saveFavorite(id: String) {
        
        favoriteFeed.append(id)
        UserDefaults.standard.set(favoriteFeed, forKey: ConstantTraining.FavoriteFeedKey)
    }
    
    /// - Description:
    ///　お気に入りを削除
    /// - Parameters:
    ///     - id: 記事のID
    /// - Returns:
    public func deleteFavorite(id: String) {
        
        favoriteFeed = favoriteFeed.filter { $0 != id }
    }
    
    /// - Description:
    ///　お気に入りを確認
    /// - Parameters:
    ///     - id: 記事のID
    /// - Returns:
    public func checkFavorite(id: String) -> Bool{
        
        return favoriteFeed.contains(id)
    }
}
