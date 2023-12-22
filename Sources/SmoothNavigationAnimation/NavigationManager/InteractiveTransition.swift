//
//  File.swift
//  
//
//  Created by Sejal.Sethiya on 21/12/23.
//

import UIKit

public class InteractiveTransition: UIPercentDrivenInteractiveTransition {
    public var interactionInProgress = false

    @objc dynamic func handlePanGesture(gesture: UIPanGestureRecognizer) {
        guard let view = gesture.view else { return }
        
        let translation = gesture.translation(in: view)
        let progress = abs(translation.x) / view.bounds.width

        switch gesture.state {
        case .began:
            interactionInProgress = true
            // Implement any necessary setup for the interactive transition
        case .changed:
            update(progress)
            // Implement any animations or changes based on progress
        case .cancelled:
            interactionInProgress = false
            cancel()
        case .ended:
            interactionInProgress = false
            if progress > 0.5 {
                finish()
            } else {
                cancel()
            }
        default:
            break
        }
    }
}
