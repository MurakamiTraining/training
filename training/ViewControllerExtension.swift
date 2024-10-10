//
//  ViewControllerExtension.swift
//  training
//
//  Created by 村上拓也 on 2024/09/09.
//

import UIKit

// 既存のUIViewControllerの拡張
class ViewControllerExtension: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
    }
    
    /// - Description:
    /// 次のシーンへ遷移
    /// - Parameters:
    ///     - storyboardID:  ストーリーボードで指定されたID
    /// - Returns:
    func moveNextView(storyboardID: ConstantTraining.StoryboardID){
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: storyboardID.rawValue)
        navigationController?.pushViewController(nextVC!, animated: true)
    }
    
    /// - Description:
    /// 現在のViewを取得
    /// - Parameters:
    /// - Returns:
    ///     - UIViewController: 次画面のUIViewController
    func getCurrentView() -> UIViewController?  {
        
        return navigationController?.viewControllers.last
    }
    
    // 前画面へ遷移
    func movePrevView() {

        navigationController?.popViewController(animated: true)
    }
}
