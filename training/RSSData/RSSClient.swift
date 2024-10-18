//
//  RSSClient.swift
//  training
//
//  Created by 村上拓也 on 2024/09/12.
//

import UIKit
import Alamofire
import SwiftSoup

class RSSClient {
    /// - Description:
    /// RSSの情報を取得して変換する
    /// - Parameters:
    ///     - url:  RSSのURL
    /// - Returns:
    ///     - RSSList: RSS情報リスト
    static func RequestRSSList(urlString:String, requestComplete: @escaping (Result<RSSList, Error>) -> ()) {
        // URL文字列の変換
        let url = URL(string: urlString)!
        // リクエストの作成
        let request = URLRequest(url: url)
        // リクエスト処理を実行
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // RSSデータ受信後
            
            // エラー時の処理を記載
            
            // 成功時の処理を記載
            let jsonDecoder = JSONDecoder()
            guard let responseData = data else { return }
            guard let rssList = try?jsonDecoder.decode(RSSList.self, from: responseData) else { return }
            requestComplete(.success(rssList))
        }
        task.resume()
    }
    
    /// - Description:
    /// RSSの詳細情報を取得してHTMLから要素を抜き出し
    /// - Parameters:
    ///     - url:  記事のURL
    /// - Returns:
    ///     - RSSDetail: 記事詳細情報
    //TODO: 複数のRSSサイトに対応するように修正する
    static func RequestRSSDetail(rssSimple: FeedSimple, requestComplete: @escaping (Result<FeedDetail, Error>) -> ()) {
        AF.request(rssSimple.link, method: .get).validate().responseString { response in
            // データ取得の失敗
            guard let data = response.data else {
                print("nil response.data")
                return
            }
            // データの変換
            switch response.result {
            case .success:
                // 選択中のRSSIdを取得
                let selectedRSSId = RSSDataManager.shared.loadSelectRSSId()
                var rssDetail: FeedDetail
                switch selectedRSSId {
                    case .NHK:
                        guard let convertedData = self.convertNHKHtmlData(rssSimple: rssSimple, data: data) else { return }
                        rssDetail = convertedData
                    case .Gigazine:
                        guard let convertedData = self.convertGigazineHtmlData(rssSimple: rssSimple, data: data) else { return }
                        rssDetail = convertedData
                    default :
                        return
                }
                requestComplete(.success(rssDetail))
                break
            case .failure:
                print("error: \(response.error!)")
                return
            }
        }
    }
    
    /// - Description:
    /// NHKの記事HTMLから要素を抽出
    /// - Parameters:
    ///     - rssSimple: RSS簡易情報
    ///     - data: レスポンスデータ
    /// - Returns:
    ///     - RSSDetail: 記事詳細情報
    private static func convertNHKHtmlData(rssSimple: FeedSimple, data: Data) -> FeedDetail? {
        guard let htmlData = String(data: data, encoding: .utf8) else { return nil }
        // HTML文字列をパース
        var document: Document
        do {
            document = try SwiftSoup.parse(htmlData)
        } catch {
            print("html parse error")
            return nil
        }
        let title = rssSimple.title
        // 記事ヘッダ画像の取得
        var image = ""
        do {
            image = try document.getElementsByClass("lazy").select("img").attr("data-src")
        } catch {  }
        let imageUrl = "https://www3.nhk.or.jp" + image
        var detail = ""
        do {
            for doc in try document.getElementsByClass("content--detail-body").select("p") {
                detail += "\n"
                detail += "\n"
                detail += doc.ownText()
            }
        } catch {}
         // 変換したデータを設定
         let rssDetail = FeedDetail(id: rssSimple.guid, title: title, detail: detail, pubData: rssSimple.pubDate, image: imageUrl, url: rssSimple.link)
         return rssDetail
    }
    
    /// - Description:
    /// Gigazineの記事HTMLから要素を抽出
    /// - Parameters:
    ///     - rssSimple: RSS簡易情報
    ///     - data: レスポンスデータ
    /// - Returns:
    ///     - RSSDetail: 記事詳細情報
    private static func convertGigazineHtmlData(rssSimple: FeedSimple, data: Data) -> FeedDetail? {
        // HTMLデータをエンコード
        guard let htmlData = String(data: data, encoding: .utf8) else { return nil }
        // HTML文字列をパース
        var document: Document
        do {
            document = try SwiftSoup.parse(htmlData)
        } catch {
            print("html parse error")
            return nil
        }
        // タイトルテキストの取得
        let title = rssSimple.title
        // 記事ヘッダ画像の取得
        var image = ""
        do {
            image = try document.getElementsByClass("lzsmall img-standard-size").select("img").attr("src")
        } catch {  }
        // 記事詳細の取得
        var detail = ""
        do {
            for doc in try document.getElementsByClass("preface").select("p") {
                detail += "\n"
                detail += doc.ownText()
            }
        } catch {  }
        // 変換したデータを設定
        let rssDetail = FeedDetail(id: rssSimple.guid, title: title, detail: detail, pubData: rssSimple.pubDate, image: image, url: rssSimple.link)
        return rssDetail
    }
}
