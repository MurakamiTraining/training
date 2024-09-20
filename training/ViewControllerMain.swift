//
//  ViewControllerMain.swift
//  training
//
//  Created by 村上拓也 on 2024/09/09.
//

import UIKit

/// - Description:
/// RSS記事一覧表示用のコントローラ
class ViewControllerMain: ViewControllerExtension, UITableViewDelegate, UITableViewDataSource {

    // RSS情報
    private var rssList: RSSList!
    
    // RSSテーブルビューの参照
    @IBOutlet weak var rssTableView: UITableView!
    
    /// - Description:
    /// 画面読み込み後
    /// - Parameters:
    /// - Returns:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // RSSのリクエスト
        ClientRSS.RequestRSSList(urlString: ConstantTraining.RSSUrl.RssToJsonApiUrl + ConstantTraining.RSSUrl.TopPicksUrl, requestComplete: {(response) in
            
            switch response {
                
                // RSSList取得完了
            case .success(let rssListResponse):
                self.RSSCollectionViewSetup(rssListResponse: rssListResponse)
                
                // RSSList取得失敗
            case .failure(let error):
                debugPrint(error)
            }
        })
    }
    
    /// - Description:
    /// テーブルビューセル数の指定
    /// - Parameters:
    /// - Returns:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // rssListの取得が成功していたら
        if rssList != nil {
            return rssList.items.count
        } else {
            return 0
        }
    }
    
    /// - Description:
    /// テーブルビューセルの作成
    /// - Parameters:
    /// - Returns:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RSSTableViewCell", for: indexPath) as! TableViewCellRSS
        
        // rss情報が取得できているかチェック
        if rssList == nil {
            return cell
        }
        
        // rss情報を元にUIを設定
        cell.Setup(rssDetail: rssList.items[indexPath.row])
        
        return cell
    }
    
    /// - Description:
    /// テーブルビューのセルの高さ設定
    /// - Parameters:
    /// - Returns:
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height / 4.0
    }
    
    
    /// - Description:
    /// RSS情報に基づいたコレクションビューのセットアップ
    /// - Parameters:
    ///     - rssListResponse:  RSSList情報
    /// - Returns:
    func RSSCollectionViewSetup(rssListResponse: RSSList) {
        
        // 取得したRSS情報をクラスに保持
        rssList = rssListResponse
        
        // メインスレッドにてテーブルビューを更新
        // 他のスレッドでのreloadDataは問題あり
        DispatchQueue.main.async {
            self.rssTableView.reloadData()
        }
    }
    
    /// - Description:
    /// 戻るボタン押下時の処理
    /// - Parameters:
    ///     - rssListResponse:  RSSList情報
    /// - Returns:
    @IBAction func buttonPrevDidTap() {
        
    }
}
