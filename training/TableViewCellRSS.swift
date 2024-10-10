//
//  TableViewCellRSS.swift
//  training
//
//  Created by 村上拓也 on 2024/09/20.
//

import UIKit

/// - Description:
/// RSSテーブルビューのカスタムセル
class TableViewCellRSS: UITableViewCell {
    // UIデータのアウトレット接続
    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var contentDate: UILabel!
    
    /// - Description:
    /// セル表示内容のセットアップ
    /// - Parameters:
    ///     - rssDetail: RSS記事の詳細
    /// - Returns:
    func Setup(rssSimple: FeedSimple) {
        contentTitle.text = rssSimple.title
        contentDate.text = rssSimple.pubDate
    }
}
