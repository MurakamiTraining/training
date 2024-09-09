//
//  ViewControllerSignup.swift
//  training
//
//  Created by 村上拓也 on 2024/09/05.
//

import UIKit

class ViewControllerSignup: ViewControllerExtension {

    // 画面読み込み後
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.orange
        
        // 戻るボタン
        let buttonPrev = UIButton()
        
        buttonPrev.setTitle("Prev", for: .normal)
        buttonPrev.frame = CGRect(x: self.view.frame.width/2 - 150, y: self.view.frame.height/2, width: 300, height: 80)
        buttonPrev.backgroundColor = UIColor.blue
        buttonPrev.addTarget(self, action: #selector(buttonPrevDidTap), for: .touchUpInside)
        
        self.view.addSubview(buttonPrev)
    }

    
    // 戻るボタン押下後
    @IBAction func buttonPrevDidTap() {
        
        ViewControllerManager.shared.movePrevView(currentVC: self)
    }
}
