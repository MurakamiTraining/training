//
//  RSSSelectViewController.swift
//  training
//
//  Created by 村上拓也 on 2024/10/16.
//

import UIKit

/// - Description:
/// ViewController基本処理
class RSSSelectViewController: UIViewController {
    // UIデータのアウトレット接続
    @IBOutlet weak var selectButton: UIButton!
    // 選択中のRSS
    private var selectRSSId: ProjectConstant.RSSId = .NHK
    
    // 画面読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// - Description:
    /// 選択ボタン押下時
    /// - Parameters:
    /// - Returns:
    @IBAction func onTapSelectButton() {
        navigationController?.moveNextView(storyboardID: .RSSFeedList)
    }
}

/// - Description:
/// テーブルビュー関連処理
extension RSSSelectViewController: UITableViewDelegate, UITableViewDataSource {
    /// - Description:
    /// テーブルビューのセル数設定
    /// - Parameters:
    /// - Returns:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectConstant.RSSId.Max.rawValue
    }
    
    /// - Description:
    /// テーブルビューのセル生成
    /// - Parameters:
    /// - Returns:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RSSTableViewCell", for: indexPath) as? RSSTableViewCell
        guard let rssTableViewCell = cell else {return RSSTableViewCell()}
        // 行数をRSSIdに変換（デフォルトは0）
        let rssId: ProjectConstant.RSSId = ProjectConstant.RSSId(rawValue: indexPath.row) ?? ProjectConstant.RSSId.NHK
        // RSSごとにUIをセットアップ
        rssTableViewCell.setup(rssId: rssId)
        return rssTableViewCell
    }
    
    /// - Description:
    /// テーブルビューセルの選択時処理
    /// - Parameters:
    /// - Returns:
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rssId: ProjectConstant.RSSId = ProjectConstant.RSSId(rawValue: indexPath.row) ?? ProjectConstant.RSSId.NHK
        RSSDataManager.shared.saveSelectRSSId(rssId: rssId)
    }
}
