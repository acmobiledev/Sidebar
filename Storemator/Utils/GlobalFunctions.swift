//
//  Functions.swift
//  Storemator
//
//  Created by Amit Chaudhary on 12/24/20.
//  Copyright © 2020 Amit Chaudhary. All rights reserved.
//

import Foundation
import UIKit

//get current window
func getCurrentWindow() -> UIWindow {
    var window = UIWindow()
    for scene in UIApplication.shared.connectedScenes {
        if scene.activationState == .foregroundActive {
            let sceneDelegate = scene.delegate as! SceneDelegate
            window = sceneDelegate.window!
        }
    }
    return window
}

/// Judge whether the phone has a top notch
func hasTopNotch()-> Bool {
    if #available(iOS 11.0, *) {
        let top = UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0
        return top < CGFloat(24) ? false : true
    } else {
        return false
    }
}

/// delay action
func delay(_ timeInterval: TimeInterval, closure: @escaping()->()) {
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + timeInterval) {
        closure()
    }
}
