//
//  RSSFeedListViewController.swift
//  training
//
//  Created by 村上拓也 on 2024/09/09.
//

import UIKit

/// - Description:
/// RSS記事一覧表示用のコントローラ
class RSSFeedListViewController: ViewControllerExtension, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    // UIデータのアウトレット接続
    @IBOutlet weak var rssTableView: UITableView!
    @IBOutlet weak var topicCollectionView: UICollectionView!
    
    // RSS情報
    private var rssList: RSSList!
    // 選択中のトピック
    private var selectedTopic = 0
    
    /// - Description:
    /// 画面読み込み後
    /// - Parameters:
    /// - Returns:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // セルの登録
        topicCollectionView.register(UINib(nibName: "TopicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopicCollectionViewCell")
        // 初回主要トピック表示
        changeTopic(rssTopic: ProjectConstant.nhkRSSTopics[0])
    }
    
    /// - Description:
    /// 表示トピックの切り替え
    /// - Parameters:
    ///     - rssTopic: トピック情報
    /// - Returns:
    func changeTopic(rssTopic: ProjectConstant.RSSTopic) {
        // RSSのリクエスト(初期値は主要トピック)
        RSSClient.RequestRSSList(urlString: ProjectConstant.RSSUrl.RssToJsonApiUrl + rssTopic.url, requestComplete: { (response) in
            switch response {
                // RSSList取得完了
            case .success(let rssListResponse):
                self.selectedTopic = rssTopic.id
                self.rssCollectionViewSetup(rssListResponse: rssListResponse)
                // RSSList取得失敗
            case .failure(let error):
                debugPrint(error)
            }
        } )
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "RSSFeedTableViewCell", for: indexPath) as! RSSFeedTableViewCell
        // rss情報が取得できているかチェック
        if rssList == nil { return cell }
        // rss情報を元にUIを設定
        cell.Setup(rssSimple: rssList.items[indexPath.row])
        return cell
    }
    
    /// - Description:
    /// テーブルビューの選択時処理
    /// - Parameters:
    /// - Returns:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveNextView(storyboardID: .RSSFeedDetail)
        let nextViewController = getCurrentView() as? RSSFeedDetailViewController
        guard let detailViewController = nextViewController else {
            print("RSSFeedDetailViewController is nil")
            return
        }
        detailViewController.RequestRSSDetail(rssSimple: rssList.items[indexPath.row])
    }
    
    
    /// - Description:
    /// RSS情報に基づいたコレクションビューのセットアップ
    /// - Parameters:
    ///     - rssListResponse:  RSSList情報
    /// - Returns:
    func rssCollectionViewSetup(rssListResponse: RSSList) {
        // 取得したRSS情報をクラスに保持
        rssList = rssListResponse
        // メインスレッドにてテーブルビューを更新
        // 他のスレッドでのreloadDataは問題あり
        DispatchQueue.main.async {
            self.rssTableView.reloadData()
        }
    }
    
    /// - Description:
    /// セクション数の設定
    /// - Parameters:
    /// - Returns:
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProjectConstant.nhkRSSTopics.count
    }
    
    /// - Description:
    /// セルの生成
    /// - Parameters:
    /// - Returns:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopicCollectionViewCell", for: indexPath) as? TopicCollectionViewCell {
            cell.setup(rssTopic: ProjectConstant.nhkRSSTopics[indexPath.row], viewControllerMain:  self)
            let selectedBackgroundView = UIView()
            selectedBackgroundView.backgroundColor = UIColor.gray
            cell.selectedBackgroundView = selectedBackgroundView
            return cell
        }
        return UICollectionViewCell()
    }
    
    /// - Description:
    /// セルの選択時
    /// - Parameters:
    /// - Returns:
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        changeTopic(rssTopic: ProjectConstant.nhkRSSTopics[indexPath.row])
    }
    
    /// - Description:
    /// 戻るボタン押下時の処理
    /// - Parameters:
    ///     - rssListResponse:  RSSList情報
    /// - Returns:
    @IBAction func onTapBackButton() {
        movePrevView()
    }
}
