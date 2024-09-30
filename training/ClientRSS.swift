//
//  ClientRSS.swift
//  training
//
//  Created by 村上拓也 on 2024/09/12.
//

import UIKit

class ClientRSS {
    
    // URL先のRSS情報を取得
    // Result型の引数を使用することで失敗時の処理わけが可能
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
            
            // tips:guardは条件を満たさない場合の処理を記述するための書式
            guard let rssList = try?jsonDecoder.decode(RSSList.self, from: data!) else {
                
                return
            }
            
            requestComplete(.success(rssList))
        }
         
        task.resume()
    }
}
