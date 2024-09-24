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
    
    // RSSトピック定義
    static let rssTopics: [RSSTopic] = [
        RSSTopic(title: "主要", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/top-picks.xml"),
        RSSTopic(title: "国内", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/domestic.xml"),
        RSSTopic(title: "国際", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/world.xml"),
        RSSTopic(title: "経済", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/business.xml"),
        RSSTopic(title: "エンタメ", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/entertainment.xml"),
        RSSTopic(title: "スポーツ", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/sports.xml"),
        RSSTopic(title: "IT", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/it.xml"),
        RSSTopic(title: "科学", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/science.xml"),
        RSSTopic(title: "ライフ", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/life.xml"),
        RSSTopic(title: "地域", id: RSSTopicId.Picks, url: "https://news.yahoo.co.jp/rss/topics/local.xml")
    ]
    
    struct RSSTopic {
        
        let title: String
        let id: RSSTopicId
        let url: String
    }
    
    enum RSSTopicId: Int {
        
        case Picks = 0
        case Domestic
        case World
        case Business
        case Entertainment
        case It
        case Science
        case life
        case Local
    }
    
    // Storyboard定義
    enum StoryboardID: String {
        
        case Login    = "ViewControllerLogin"
        case Main     = "ViewControllerMain"
    }
    
}
