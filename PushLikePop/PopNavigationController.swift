//
//  PopNavigationController.swift
//  PushLikePop
//
//  Created by Hiroaki Tomiyoshi on 2017/12/15.
//  Copyright © 2017 Hiroaki Tomiyoshi. All rights reserved.
//

import UIKit

class PopNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        interactivePopGestureRecognizer?.delegate = self
    }

}

extension PopNavigationController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        if operation == .push {
            return PopAnimator()
        }
        return nil
    }
}

extension PopNavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
