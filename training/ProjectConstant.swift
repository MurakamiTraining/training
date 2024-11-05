//
//  ProjectConstant.swift
//  training
//
//  Created by 村上拓也 on 2024/09/09.
//

import Foundation

/// - Description:
// 定数関連まとめ
class ProjectConstant {
    // RSS関連のURLリスト
    struct RSSUrl {
        // RSSをJSONに変換するサービスを利用
        static let RssToJsonApiUrl = "https://api.rss2json.com/v1/api.json?rss_url="
    }
    
    // RSS識別用
    enum RSSId: Int {
        case NHK = 0    // NHK
        case Gigazine   // Gigazine
        case Max        // 最大RSS数
    }
    
    // NHKRSSトピック定義
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
    
    // gigazinトピック定義
    static let gigazineRSSTopics: [RSSTopic] = [
        RSSTopic(title: "総合", id: gigazineTopicID.All.rawValue, url: "https://gigazine.net/news/rss_2.0/"),
        RSSTopic(title: "デイリー", id: gigazineTopicID.Daily.rawValue, url: "https://dailyfeed.jp/feed/110.rss"),
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
    
    // RSSトピックID（ITmeida）
    enum gigazineTopicID: Int {
        case Daily = 0
        case All
    }
    
    // Storyboard定義
    enum StoryboardID: String {
        case Login = "LoginViewController"
        case Signup = "SignupViewController"
        case RSSFeedList = "RSSFeedListViewController"
        case RSSFeedDetail = "RSSFeedDetailViewController"
        case RSSSelect = "RSSSelectViewController"
    }
    
    // 保存データキー
    static let appleUserIdKey = "appleUserId"
    static let userIdKey = "userId"
    static let passwordKey = "password"
    static let alreadyLoginKey = "alreadyLogin"
    static let FavoriteReportIdsKey = "FavoriteReportIds"
    static let SelectRSSIdKey = "SelectRSSId"
}
