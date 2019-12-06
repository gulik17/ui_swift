//
//  CustomImageView.swift
//  vkontakte
//
//  Created by Администратор on 05.12.2019.
//  Copyright © 2019 Home. All rights reserved.
//

import UIKit

@IBDesignable class CustomImageView: UIView {
    private var shadowLayer: CAShapeLayer!

    @IBInspectable var cornerRadius: CGFloat = 25 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var shadowColor: UIColor = .systemTeal {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable var shadowOpacity: Float = 1 {
        didSet {
            setNeedsDisplay()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            shadowLayer.shadowColor = shadowColor.cgColor
            shadowLayer.shadowPath = shadowLayer.path
            shadowLayer.shadowOffset = .zero
            shadowLayer.shadowOpacity = shadowOpacity
            shadowLayer.shadowRadius = shadowRadius
            layer.insertSublayer(shadowLayer, at: 0)
        }
        setNeedsDisplay()
    }
}
