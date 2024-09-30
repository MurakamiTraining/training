//
//  CollectionViewCellTopic.swift
//  training
//
//  Created by 村上拓也 on 2024/09/20.
//

import UIKit

/// - Description:
/// トピック表示用カスタムセル
class CollectionViewCellTopic: UICollectionViewCell {
    
    
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
    func setup(rssTopic: ConstantTraining.RSSTopic, viewControllerMain: ViewControllerMain) {
        
        self.topicLabel.text = rssTopic.title
    }
}
