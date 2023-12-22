//
//  File.swift
//  
//
//  Created by Sejal.Sethiya on 21/12/23.
//

import Foundation
import UIKit

public class NavigationManager { 
    static let shared = NavigationManager()

    // MARK: - Custom Transition
    
    func presentWithCustomTransition(viewControllerToPresent: UIViewController) {
        let customTransition = CustomTransition()
        viewControllerToPresent.modalPresentationStyle = .custom
        viewControllerToPresent.transitioningDelegate = customTransition
        topViewController()?.present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    // MARK: - Interactive Transition
    
    func enableInteractiveTransition(viewControllerToDismiss: UIViewController) {
        let interactiveTransition = InteractiveTransition()
        let panGesture = UIPanGestureRecognizer(target: interactiveTransition, action: #selector(interactiveTransition.handlePanGesture))
        viewControllerToDismiss.view.addGestureRecognizer(panGesture)
    }
    
    // MARK: - Drawer Navigation
    
    func presentDrawer(viewControllerToPresent: UIViewController) {
        viewControllerToPresent.modalPresentationStyle = .overCurrentContext
        topViewController()?.present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    // MARK: - Page Curl Transition
    
    func presentWithPageCurlTransition(viewControllerToPresent: UIViewController) {
        let pageCurlTransition = PageCurlTransition()
        viewControllerToPresent.modalPresentationStyle = .custom
        viewControllerToPresent.transitioningDelegate = pageCurlTransition
        topViewController()?.present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    // MARK: - Helper Methods
    
    private func topViewController() -> UIViewController? {
        var topViewController = UIApplication.shared.keyWindow?.rootViewController
        while let presentedViewController = topViewController?.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }
}
