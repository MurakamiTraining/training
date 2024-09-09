//
//  ConstantTraining.swift
//  training
//
//  Created by 村上拓也 on 2024/09/09.
//

import Foundation

// 定数関連まとめ
class ConstantTraining{
    
    // Splash画面関連定数
    struct Splash{
        
        public static let SplashTime:TimeInterval = 3.0
    }
    
    // StoryBoardのIDまとめ
    enum Storyboard: String{
        
        case Login  = "StoryboardLogin"
        case Signup = "StoryboardSignup"
    }
}
