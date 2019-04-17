//
//  SubImageView.swift
//  IBOutlet&IBAction
//
//  Created by User on 2019/4/16.
//  Copyright © 2019 Lu. All rights reserved.
//

import UIKit

class SubImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height * 0.2))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height))
        path.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        layer.mask = shapeLayer
    }
}
