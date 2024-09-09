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
    
    // 次画面へ遷移
    func moveNextView(nextVC: ViewControllerExtension) {
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    // 前画面へ遷移
    func movePrevView() {

        navigationController?.popViewController(animated: true)
    }
}
