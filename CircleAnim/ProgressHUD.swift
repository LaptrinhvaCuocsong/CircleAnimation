//
//  ProgressHUD.swift
//  CircleAnim
//
//  Created by Nguyen Manh Hung on 4/17/21.
//

import UIKit

class ProgressHUD {
    static let shared = ProgressHUD()
    
    private var animView: AnimView?
    
    private init() {}
    
    func showProgress() {
        guard let keyWindow = UIApplication.keyWindow else {
            return
        }
        let animView = AnimView(frame: kScreen.bounds)
        self.animView = animView
        UIView.transition(with: keyWindow,
                          duration: 1.0,
                          options: .transitionCrossDissolve) {
            keyWindow.addSubview(animView)
        } completion: { [weak self] isSuccess in
            if isSuccess {
                self?.animView?.startAnimation()
            }
        }
    }
    
    func hideProgress() {
        
    }
}
