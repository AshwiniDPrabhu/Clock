//
//  clockAnimation.swift
//  Timer
//
//  Created by Ashwini Prabhu on 3/3/20.
//  Copyright © 2020 experiment. All rights reserved.
//

import Foundation
import UIKit

class clockAnimation: UIView {
    
    let clockImageView: UIImageView = {
        guard let gifImage = try? UIImage(contentsOfFile: "timerGiphy.gif") else {
            return UIImageView()
        }
        return UIImageView(image: gifImage)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = UIColor(white: 246.0 / 255.0, alpha: 1)
        addSubview(clockImageView)
        clockImageView.translatesAutoresizingMaskIntoConstraints = false
        clockImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        clockImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
