//
//  ClientRSS.swift
//  training
//
//  Created by 村上拓也 on 2024/09/12.
//

import UIKit
import Alamofire
import SwiftSoup

class ClientRSS {
    
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
            
            // tips:guardは条件を満たさない場合の処理を記述するための書式
            guard let rssList = try?jsonDecoder.decode(RSSList.self, from: responseData) else {
                
                return
            }
            
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
    static func RequestRSSDetail(rssSimple: RSSSimple, requestComplete: @escaping (Result<RSSDetail, Error>) -> ()) {
        
        AF.request(rssSimple.link, method: .get).validate().response { response in
                
                // データ取得の失敗
                guard let data = response.data else {
                    print("nil response.data")
                    
                    return
                }
                
                // データの変換
                do {
                    //TODO: マジックナンバーをどうにかする
                    guard let htmlData = String(data: data, encoding: .utf8) else { return }
                    let document = try SwiftSoup.parse(htmlData)
                    
                    let title = try document.title()
                    let image = try document.getElementsByClass("lazy").select("img").attr("data-src")
                    let imageUrl = "https://www3.nhk.or.jp" + image
                    guard var detail = try document.getElementsByClass("content--summary").first()?.ownText() else {
                            print("nil detail")
                            return
                        }
                    
                    detail += "\n"
                    for doc in try document.getElementsByClass("body-text") {
                        
                        if doc.children().count == 0 {continue}
                        guard let element = doc.children().first() else {continue}
                        
                        detail += "\n"
                        detail += element.ownText()
                    }
                    
                    let rssDetail = RSSDetail(id: rssSimple.guid, title: title, detail: detail, pubData: rssSimple.pubDate, image: imageUrl, url: rssSimple.link)
                    
                    requestComplete(.success(rssDetail))
                } catch {
                    
                    print("http parse error")
                    
                    return
                }
            }
    }
}
