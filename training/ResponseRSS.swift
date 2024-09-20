//
//  ResponseRSS.swift
//  training
//
//  Created by 村上拓也 on 2024/09/12.
//

// RSSのレスポンスモデル定義
struct RSSList: Codable {
    
    let status: String          // 通信ステータス
    let feed: RSSFeed           // RSSフィード
    let items: [RSSDetail]      // RSS記事詳細
}

// RSSフィード定義
struct RSSFeed: Codable {
    
    let url: String             // フィードURL
    let title: String           // フィードタイトル
    let link: String            // フィードリンク
    let description: String     // フィード概要
}

// RSS詳細記事定義
struct RSSDetail: Codable {
    
    let title: String           // 記事タイトル
    let pubDate: String         // 掲載日時
    let link: String            // 記事リンク
    let guid: String            // 記事Id
    let author: String          // 記事著者
}
