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
    // 選択中のRSS
    var selectRSSId: ProjectConstant.RSSId = .NHK
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
        let rssId = UserDefaults.standard.integer(forKey: ProjectConstant.SelectRSSIdKey)
        selectRSSId = ProjectConstant.RSSId(rawValue: rssId) ?? ProjectConstant.RSSId.NHK
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
    
    /// - Description:
    ///　選択中のRSSIdを保存
    /// - Parameters:
    ///     - rssId: 選択するRSSId
    /// - Returns:
    public func saveSelectRSSId(rssId: ProjectConstant.RSSId) {
        selectRSSId = rssId
        UserDefaults.standard.set(selectRSSId.rawValue, forKey: ProjectConstant.SelectRSSIdKey)
    }
    
    /// - Description:
    ///　選択中のRSSIdを取得
    /// - Parameters:
    /// - Returns:
    ///     - rssId: 選択中のRSSId
    public func loadSelectRSSId() -> ProjectConstant.RSSId {
        return selectRSSId
    }
}
