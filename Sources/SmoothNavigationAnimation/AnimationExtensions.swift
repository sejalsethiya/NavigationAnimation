//
//  File.swift
//  
//
//  Created by Sejal.Sethiya on 21/12/23.
//

import UIKit

public extension UIView {
    
    func fadeIn(duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration) {
            self.alpha = 1.0
        }
    }
    
    func slideIn(duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration) {
            self.transform = .identity
        }
    }
    
    func scaleUp(duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration) {
            self.transform = .identity
        }
    }
    
    func rotate(duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration) {
            self.transform = self.transform.rotated(by: .pi)
        }
    }
    
    func bounce(duration: TimeInterval = 0.5) {
        UIView.animate(withDuration: duration, animations: {
            self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: duration) {
                self.transform = .identity
            }
        }
    }
    
    func shake(duration: TimeInterval = 0.5) {
            let shake = CABasicAnimation(keyPath: "position")
            shake.duration = duration
            shake.repeatCount = 2
            shake.autoreverses = true
            shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
            shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
            layer.add(shake, forKey: "position")
        }
    // Add other animation extensions here
}
