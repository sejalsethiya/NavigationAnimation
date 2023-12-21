//
//  File.swift
//  
//
//  Created by Sejal.Sethiya on 21/12/23.
//

import Foundation
import UIKit

class PageCurlTransition: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Implement your page curl transition animation logic here
        guard let toViewController = transitionContext.viewController(forKey: .to) else { return }

        let containerView = transitionContext.containerView
        containerView.addSubview(toViewController.view)

        toViewController.view.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toViewController.view.transform = .identity
        }) { _ in
            transitionContext.completeTransition(true)
        }
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8 // Set the duration for the transition
    }
}
