//
//  CollectionViewLayoutRSS.swift
//  training
//
//  Created by 村上拓也 on 2024/09/18.
//

import UIKit

// RSS表示コレクションビューのレイアウト設定
class CollectionViewLayoutRSS: UICollectionViewLayout {
    
    private var layoutData = [UICollectionViewLayoutAttributes]()
    
    // レイアウト準備
    override func prepare() {
        super.prepare()
        
        self.layoutData.removeAll()
        let cellWidth = collectionView?.bounds.width
        let cellHeight = 40
        
        for count in 0 ... collectionView!.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: count, section: 0)
            let 
        }
    }
}
