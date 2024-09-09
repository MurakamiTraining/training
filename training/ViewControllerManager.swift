//
//  ViewControllerManager.swift
//  training
//
//  Created by 村上拓也 on 2024/09/09.
//


// ViewControllerを管理するクラスを作成しようとしたが、UIViewController自身で管理されていたり、UINavigation Controllerで詳細に管理できそうなので一旦保留
import UIKit

// ViewControllerの管理用クラス(シングルトン)
final public class ViewControllerManager {
    
    public static let shared = ViewControllerManager()
    // ViewController管理キュー
    private var viewControllerQueue = [ViewControllerExtension]()
    
    // Swiftのコンストラクタ
    private init() {
        
    }
    
    // 通常画面遷移
    func moveNextView(currentVC: ViewControllerExtension, nextVC: ViewControllerExtension) {
        
        // キュー管理に追加
        viewControllerQueue.append(nextVC)
        
        // 画面遷移
        nextVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        currentVC.present(nextVC, animated: true)
    }
    
    func movePrevView(currentVC: ViewControllerExtension) {
        
        // 現在のビューをキュー管理から除外
        viewControllerQueue.removeLast()
        
        
        
        // 前の画面に遷移
        currentVC.dismiss(animated: true)
    }
}
