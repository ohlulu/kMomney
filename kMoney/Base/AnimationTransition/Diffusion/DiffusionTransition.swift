//
//  DiffusionTransition.swift
//  AnimationDemo
//
//  Created by ohlulu on 2019/3/2.
//  Copyright © 2019 ohlulu. All rights reserved.
//

import UIKit

class DiffusionTransition: NSObject, UIViewControllerTransitioningDelegate {
    
    var targetPoint = CGPoint.zero
    
    private let grayView = UIView()
    
    lazy var presentAnimation = DiffustionPresentAnimation(startPoint: targetPoint)
    lazy var dismissAnimation = DiffusionDismissAnimation(endPoint: targetPoint)
    
    let interaction = UpToDownIneraction()
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
        presentAnimation.grayView = grayView
        return presentAnimation
    }
    
    func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
        dismissAnimation.grayView = grayView
        return dismissAnimation
    }
    
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return nil
    }
    
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        print(interaction.interacting)
        return interaction.interacting ? interaction : nil
    }
    
}
