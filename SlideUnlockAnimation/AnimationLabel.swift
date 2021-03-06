//
//  AnimationLabel.swift
//  SlideUnlockAnimation
//
//  Created by Daniel on 15/12/31.
//  Copyright © 2015年 Daniel. All rights reserved.
//

import UIKit

class AnimationLabel: UIView {
    
    
    var gradientLayer:CAGradientLayer?
    var animation:CABasicAnimation?
    var isAnimation:Bool = false {
        didSet {
            if isAnimation {
                animation = CABasicAnimation(keyPath: "locations")
                animation?.duration = 2
                animation?.fromValue = [-0.5,-0.25,0]
                animation?.toValue = [1,1.25,1.5]
                animation?.repeatCount = HUGE
                animation?.removedOnCompletion = false
                
                gradientLayer!.addAnimation(animation!, forKey: nil)
            }
        }
    }
    var colors:[CGColor] {
        set(newColors) {
            gradientLayer!.colors = newColors
        }
        get {
            return gradientLayer?.colors as! [CGColorRef]
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel(frame: self.bounds)
        label.text = "Slide unlock animation";
        label.textAlignment = NSTextAlignment.Center
        self .addSubview(label)
        
        gradientLayer = CAGradientLayer()
        gradientLayer!.bounds = self.bounds
        gradientLayer!.position = CGPointMake(frame.width/2, frame.height/2)
        
        //        gradientLayer!.colors = [UIColor.blackColor().CGColor,
        //                                 UIColor.whiteColor().CGColor,
        //                                 UIColor.blackColor().CGColor];
        
        gradientLayer!.locations = [0.2,0.5,0.8];
        
        gradientLayer!.startPoint = CGPointMake(0, 0.5)
        gradientLayer!.endPoint = CGPointMake(1, 0.5)
        
        self.layer.addSublayer(gradientLayer!)
        gradientLayer!.mask = label.layer
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
