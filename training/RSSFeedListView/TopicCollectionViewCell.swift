//
//  TopicCollectionViewCell.swift
//  training
//
//  Created by 村上拓也 on 2024/09/20.
//

import UIKit

/// - Description:
/// トピック表示用カスタムセル
class TopicCollectionViewCell: UICollectionViewCell {
    // UIデータのアウトレット接続
    @IBOutlet weak var topicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    /// - Description:
    /// トピックボタンのセットアップ
    /// - Parameters:
    ///     - rssTopic: トピック情報
    ///     - viewControllerMain: 紐付けもとのViewController
    /// - Returns:
    func setup(rssTopic: ProjectConstant.RSSTopic, rssFeedListViewController: RSSFeedListViewController) {
        self.topicLabel.text = rssTopic.title
    }
}
