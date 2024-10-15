//
//  RSSDataManager.swift
//  training
//
//  Created by 村上拓也 on 2024/10/04.
//

import Foundation

/// - Description:
/// RSS記事の管理（お気に入り登録、記事のキャッシュなど）
class RSSDataManager {
    // シングルトン定義
    public static let shared = RSSDataManager()
    // お気に入り記事ID配列
    var favoriteReportIds: Array<String> = []
    
    /// - Description:
    ///　シングルトン初期化
    /// - Parameters:
    /// - Returns:
    private init() {
        loadData()
    }
    
    /// - Description:
    ///　保存データの読み込み
    /// - Parameters:
    /// - Returns:
    public func loadData() {
        favoriteReportIds = UserDefaults.standard.stringArray(forKey: ProjectConstant.FavoriteReportIdsKey) ?? favoriteReportIds
    }
    
    /// - Description:
    ///　お気に入りを保存
    /// - Parameters:
    ///     - id: 記事のID
    /// - Returns:
    public func saveFavorite(id: String) {
        favoriteReportIds.append(id)
        UserDefaults.standard.set(favoriteReportIds, forKey: ProjectConstant.FavoriteReportIdsKey)
    }
    
    /// - Description:
    ///　お気に入りを削除
    /// - Parameters:
    ///     - id: 記事のID
    /// - Returns:
    public func deleteFavorite(id: String) {
        favoriteReportIds = favoriteReportIds.filter { $0 != id }
        UserDefaults.standard.set(favoriteReportIds, forKey: ProjectConstant.FavoriteReportIdsKey)
    }
    
    /// - Description:
    ///　お気に入りを確認
    /// - Parameters:
    ///     - id: 記事のID
    /// - Returns:
    public func checkFavorite(id: String) -> Bool{
        return favoriteReportIds.contains(id)
    }
}
