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
    }
    
    // RSS識別用
    enum RSSId: Int {
        
        case NHK = 0
    }
    
    // RSSトピック定義
    static let nhkRSSTopics: [RSSTopic] = [
        RSSTopic(title: "主要ニュース", id: NHKRSSTopicId.Main.rawValue, url: "https://www.nhk.or.jp/rss/news/cat0.xml"),
        RSSTopic(title: "社会", id: NHKRSSTopicId.Society.rawValue, url: "https://www.nhk.or.jp/rss/news/cat1.xml"),
        RSSTopic(title: "科学・医療", id: NHKRSSTopicId.Science.rawValue, url: "https://www.nhk.or.jp/rss/news/cat3.xml"),
        RSSTopic(title: "政治", id: NHKRSSTopicId.Politics.rawValue, url: "https://www.nhk.or.jp/rss/news/cat4.xml"),
        RSSTopic(title: "経済", id: NHKRSSTopicId.Economy.rawValue, url: "https://www.nhk.or.jp/rss/news/cat5.xml"),
        RSSTopic(title: "国際", id: NHKRSSTopicId.World.rawValue, url: "https://www.nhk.or.jp/rss/news/cat6.xml"),
        RSSTopic(title: "スポーツ", id: NHKRSSTopicId.Sports.rawValue, url: "https://www.nhk.or.jp/rss/news/cat7.xml"),
        RSSTopic(title: "文化・エンタメ", id: NHKRSSTopicId.Entertainment.rawValue, url: "https://www.nhk.or.jp/rss/news/cat2.xml"),
    ]
    
    // RSSトピック識別用
    struct RSSTopic {
        
        let title: String
        let id: Int
        let url: String
    }
    
    // RSSトピックID（NHK）
    enum NHKRSSTopicId: Int {
        
        case Main = 0
        case Society
        case Science
        case Politics
        case Economy
        case World
        case Sports
        case Entertainment
    }
    
    // Storyboard定義
    enum StoryboardID: String {
        
        case Login    = "ViewControllerLogin"
        case Main     = "ViewControllerMain"
        case Detail   = "ViewControllerDetail"
    }
    
    // 保存データキー
    static let FavoriteFeedKey = "FavoriteFeed"
}
