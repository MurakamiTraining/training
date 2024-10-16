//
//  RSSTableViewCell.swift
//  training
//
//  Created by 村上拓也 on 2024/10/16.
//
import UIKit

class RSSTableViewCell: UITableViewCell {
    // UIデータアウトレット接続
    @IBOutlet weak var rssLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    /// - Description:
    /// 表示内容のセットアップ
    /// - Parameters:
    ///     - rssId: RSSId
    /// - Returns:
    public func setup(rssId: ProjectConstant.RSSId) {
        switch rssId {
        case .NHK:
            rssLabel.text = "NHK"
            break
        case .ITmedia:
            rssLabel.text = "ITmedia"
            break
        default :
            break
        }
    }
}
