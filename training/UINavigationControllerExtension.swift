//
//  UINavigationControllerExtension.swift
//  training
//
//  Created by 村上拓也 on 2024/09/09.
//

import UIKit

/// - Description:
/// UINavigationControllerを拡張
extension UINavigationController {
    /// - Description:
    /// 次のシーンへ遷移
    /// - Parameters:
    ///     - storyboardID:  ストーリーボードで指定されたID
    /// - Returns:
    func moveNextView(storyboardID: ProjectConstant.StoryboardID) {
        guard let nextViewController = storyboard?.instantiateViewController(withIdentifier: storyboardID.rawValue) else { return }
        pushViewController(nextViewController, animated: true)
        
        // NavigationControllerの戻るボタンを非表示
        nextViewController.navigationItem.hidesBackButton = true;
    }
    
    /// - Description:
    /// 現在のViewを取得
    /// - Parameters:
    /// - Returns:
    ///     - UIViewController: 次画面のUIViewController
    func getCurrentView() -> UIViewController? {
        return viewControllers.last
    }
    
    // 前画面へ遷移
    func movePreviousView() {
        popViewController(animated: true)
    }
}
