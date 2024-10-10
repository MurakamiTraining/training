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
    let items: [FeedSimple]      // RSS記事詳細
}

// RSSフィード定義
struct RSSFeed: Codable {
    let url: String             // フィードURL
    let title: String           // フィードタイトル
    let link: String            // フィードリンク
    let description: String     // フィード概要
}

// RSS簡易記事定義
struct FeedSimple: Codable {
    let title: String           // 記事タイトル
    let pubDate: String         // 掲載日時
    let link: String            // 記事リンク
    let guid: String            // 記事Id
    let author: String          // 記事著者
    let thumbnail: String       // サムネイル
}

// RSS詳細記事定義
struct FeedDetail {
    let id: String              // 記事Id（後々記事をキャッシュするため）
    let title: String           // 記事タイトル
    let detail: String          // 記事詳細
    let pubData: String         // 掲載日時
    let image: String           // 記事画像
    let url: String             // URL
}
