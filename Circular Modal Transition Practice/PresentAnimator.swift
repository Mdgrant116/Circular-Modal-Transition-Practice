//
//  PresentAnimator.swift
//  Circular Modal Transition Practice
//
//  Created by Michael Grant on 11/19/19.
//  Copyright © 2019 Michael Grant. All rights reserved.
//

import Foundation

import UIKit

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var buttonFrame: CGRect
    
    
    init(buttonFrame: CGRect) {
        
        self.buttonFrame = buttonFrame
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
        
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
         let fromViewController: ViewController = transitionContext.viewController(forKey: .from) as! ViewController
               
               let destinationController = transitionContext.viewController(forKey: .to)!
               
               let destinationView = destinationController.view!
               
               transitionContext.containerView.addSubview(fromViewController.view)
               
               transitionContext.containerView.addSubview(destinationView)
               
               let maskPath = UIBezierPath(ovalIn: buttonFrame)
               
               let maskLayer = CAShapeLayer()
               
               maskLayer.frame = destinationView.frame
               
               maskLayer.path = maskPath.cgPath
               
               destinationController.view.layer.mask = maskLayer
               
               let screenHeight = UIScreen.main.bounds.height
               
               let screenYHeight = screenHeight - buttonFrame.midX
               
               let buttonYHeight = buttonFrame.height / 2
               
               let scaleFactor = screenYHeight / buttonYHeight
               
               let endFrameWidth = scaleFactor * buttonFrame.width
               
               let endFrameHeight = endFrameWidth
               
               let endFrameXPos = destinationController.view.frame.midX - (endFrameWidth / 2)
               
               let endFrameYPos = CGFloat(0)
               
               let endFrame = CGRect(x: endFrameXPos, y: endFrameYPos, width: endFrameWidth, height: endFrameHeight)
               
               let bigCirclePath = UIBezierPath(ovalIn: endFrame)
               
               let pathAnimation = CABasicAnimation(keyPath: "path")
               
               pathAnimation.setValue(transitionContext, forKey: "transitionContext")
               
               pathAnimation.setValue(destinationController, forKey: "destinationVC")
               
               pathAnimation.delegate = self
               
               pathAnimation.fromValue = maskPath.cgPath
               
               pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
               
               pathAnimation.toValue = bigCirclePath.cgPath
               
               maskLayer.path = bigCirclePath.cgPath
               
               maskLayer.add(pathAnimation, forKey: nil)
        
        
    }
    
}

extension PresentAnimator: CAAnimationDelegate {
    
    
       func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
           
           if let transitionContext = anim.value(forKey: "transitionContext") as? UIViewControllerContextTransitioning,
               let destinationVC = anim.value(forKey: "destinationVC") as? SecondViewController,
               flag {
               
               transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
               
               destinationVC.view.layer.mask?.removeFromSuperlayer()
               
               
            
            
        }
        
    }
}
