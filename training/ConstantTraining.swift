//
//  ConstantTraining.swift
//  training
//
//  Created by 村上拓也 on 2024/09/09.
//

import Foundation

/// - Description:
// 定数関連まとめ
class ConstantTraining {
    
    // RSS関連のURLリスト
    struct RSSUrl {
        
        // RSSをJSONに変換するサービスを利用
        static let RssToJsonApiUrl = "https://api.rss2json.com/v1/api.json?rss_url="
        
        // 主要トピック
        static let TopPicksUrl = "https://news.yahoo.co.jp/rss/topics/top-picks.xml"
        
        // 国内トピック
        static let DomesticURL = "https://news.yahoo.co.jp/rss/domestic/domestic.xml"
    }
    
    // RSSトピック定義
    enum RSSTopic {
        
        case Picks      // 主要
        case Domestic   // 国内
    }
    
    // Storyboard定義
    enum StoryboardID: String {
        
        case Login    = "ViewControllerLogin"
        case Main     = "ViewControllerMain"
    }
    
}
