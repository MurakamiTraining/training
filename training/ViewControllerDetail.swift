//
//  ViewControllerDetail.swift
//  training
//
//  Created by 村上拓也 on 2024/09/30.
//

import UIKit
import Accounts
import SDWebImage

class ViewControllerDetail: ViewControllerExtension {
    
    @IBOutlet weak var rssImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var prevButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    // RSS記事詳細
    private var rssDetail:RSSDetail = RSSDetail(id: "", title: "", detail: "", pubData: "", image: "", url: "")
    
    // お気に入りか否か
    private var isFavorite:Bool = false
    
    // 画面読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 戻るボタン処理の追加
        prevButton.addTarget(self, action: #selector(buttonPrevDidTap), for: .touchUpInside)
        
        // シェアボタン処理の追加
        shareButton.addTarget(self, action: #selector(buttonShareDidTap), for: .touchUpInside)
        
        // お気に入りボタン処理の追加
        favoriteButton.addTarget(self, action: #selector(buttonFavoriteDidTap), for: .touchUpInside)
        
    }
    
    /// - Description:
    /// 記事詳細情報を取得
    /// - Parameters:
    /// - Returns:
    public func RequestRSSDetail(rssSimple: RSSSimple) {
        
        ClientRSS.RequestRSSDetail(rssSimple: rssSimple, requestComplete: {(response) in
            
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
        
        isFavorite = ManagerRSS.shared.checkFavorite(id: rssDetail.id)
        buttonFavoriteSwitch(isFavorite: isFavorite)
    }
    
    /// - Description:
    /// 戻るボタン押下時の処理
    /// - Parameters:
    /// - Returns:
    @IBAction func buttonPrevDidTap() {
        
        movePrevView()
    }
    
    /// - Description:
    /// お気に入りボタン押下時の処理
    /// - Parameters:
    /// - Returns:
    @IBAction func buttonFavoriteDidTap() {
        
        if isFavorite {
            
            ManagerRSS.shared.deleteFavorite(id: rssDetail.id)
            isFavorite = false
        } else {
            
            ManagerRSS.shared.saveFavorite(id: rssDetail.id)
            isFavorite = true
        }
        
        buttonFavoriteSwitch(isFavorite: isFavorite)
    }
    
    /// - Description:
    /// シェアボタン押下時の処理
    /// - Parameters:
    /// - Returns:
    @IBAction func buttonShareDidTap() {
        
        // 共有する項目
        let shareText = rssDetail.title
        let shareWebsite = rssDetail.url
        let shareImage = rssDetail.image

        let activityItems = [shareText, shareWebsite, shareImage] as [Any]

        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
    }
    
    /// - Description:
    /// シェアボタンの状態を切り替え
    /// - Parameters:
    ///     - isFavorite: お気に入りか否か
    /// - Returns:
    private func buttonFavoriteSwitch(isFavorite: Bool) {
        
        if isFavorite {
            
            favoriteButton.setTitle("お気に入り済み", for: .normal)
        } else {
            
            favoriteButton.setTitle("お気に入り", for: .normal)
        }
    }
}
