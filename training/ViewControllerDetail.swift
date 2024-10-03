//
//  ViewControllerDetail.swift
//  training
//
//  Created by 村上拓也 on 2024/09/30.
//

import UIKit
import SDWebImage

class ViewControllerDetail: ViewControllerExtension {
    
    @IBOutlet weak var rssImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var prevButton: UIButton!
    
    // RSS記事詳細
    private var rssDetail:RSSDetail = RSSDetail(id: "", title: "", detail: "", pubData: "", image: "")
    
    // 画面読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 戻るボタン処理の追加
        prevButton.addTarget(self, action: #selector(buttonPrevDidTap), for: .touchUpInside)
    }
    
    /// - Description:
    /// 記事詳細情報を取得
    /// - Parameters:
    /// - Returns:
    public func RequestRSSDetail(rssSimple: RSSSimple) {
        
        ClientRSS.RequestRSSDetail(url: rssSimple.link, requestComplete: {(response) in
            
            switch response {
                
                // RSSList取得完了
            case .success(let rssDetail):
                self.rssDetail = rssDetail
                
                self.setupUI()
                
                // RSSList取得失敗
            case .failure(let error):
                debugPrint(error)
            }
        })
    }
    
    /// - Description:
    /// 記事詳細情報を元にUIを更新
    /// - Parameters:
    /// - Returns:
    private func setupUI() {
        
        titleLabel.text = rssDetail.title
        detailTextView.text = rssDetail.detail
        SDWebImageManager.shared.loadImage(with: URL(string: rssDetail.image),
                                           progress: nil,
                                           completed: {(image, data, error, cache, finished, url) in
            
            self.rssImageView.image = image
        })
    }
    
    /// - Description:
    /// 戻るボタン押下時の処理
    /// - Parameters:
    ///     - rssListResponse:  RSSList情報
    /// - Returns:
    @IBAction func buttonPrevDidTap() {
        
        movePrevView()
    }
}
