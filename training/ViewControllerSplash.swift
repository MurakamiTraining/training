//
//  ViewControllerSplash.swift
//  training
//
//  Created by 村上拓也 on 2024/09/09.
//

import UIKit

class ViewControllerSplash: ViewControllerExtension {

    // 画面読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        let splashLabel = UILabel()
        let splashLabelWidth: CGFloat = 300
        let splashLabelHeight: CGFloat = 80
        
        splashLabel.text = "RSSリーダー"
        splashLabel.frame = CGRect(x: self.view.frame.width/2 - 150, y: self.view.frame.height/2 - 100, width: splashLabelWidth, height: splashLabelHeight)
        splashLabel.textAlignment = NSTextAlignment.center
        splashLabel.textColor = UIColor.white
        
        
        self.view.addSubview(splashLabel)
        
        // Splash画面表示後に移行
        perform(#selector(moveLogin), with: nil, afterDelay: ConstantTraining.Splash.SplashTime)
    }
    
    // 次画面へ遷移
    @objc func moveLogin() {
        
        ViewControllerManager.shared.moveNextView(currentVC: self, nextVC: ViewControllerLogin())
    }
}
