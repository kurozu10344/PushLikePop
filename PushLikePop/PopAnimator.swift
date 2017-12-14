//
//  PopAnimator.swift
//  PushLikePop
//
//  Created by Hiroaki Tomiyoshi on 2017/12/15.
//  Copyright © 2017 Hiroaki Tomiyoshi. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.viewController(forKey: .from)?.view,
            let toView = transitionContext.viewController(forKey: .to)?.view else
        {
            transitionContext.completeTransition(true)
            return
        }
        
        transitionContext.containerView.addSubview(toView)
        
        toView.frame = CGRect(x: fromView.frame.origin.x - fromView.frame.size.width,
                              y: fromView.frame.origin.y,
                              width: toView.frame.width,
                              height: toView.frame.height)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext),
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: UIViewAnimationOptions.init(rawValue: 0),
                       animations: {
                        fromView.frame = CGRect(x: fromView.frame.origin.x + fromView.frame.size.width,
                                                y: fromView.frame.origin.y,
                                                width: fromView.frame.size.width,
                                                height: fromView.frame.size.height)
                        toView.frame = CGRect(x: toView.frame.origin.x + fromView.frame.size.width,
                                              y: toView.frame.origin.y,
                                              width: toView.frame.size.width,
                                              height: toView.frame.size.height)
        },
                       completion: { _ in
                        transitionContext.completeTransition(true)
        })
    }
}
