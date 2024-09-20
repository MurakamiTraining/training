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
    
    // コンテンツ画像
    @IBOutlet weak var contentImage: UIImageView!
    
    @IBOutlet weak var contentTitle: UILabel!
    
    @IBOutlet weak var contentDate: UILabel!
    
    /// - Description:
    /// セル表示内容のセットアップ
    /// - Parameters:
    ///     - rssDetail: RSS記事の詳細
    /// - Returns:
    func Setup(rssDetail: RSSDetail) {
        
        contentTitle.text = rssDetail.title
        contentDate.text = rssDetail.pubDate
    }
}
