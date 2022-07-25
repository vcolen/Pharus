//
//  CircleProgressView.swift
//  Pharus
//
//  Created by Victor Colen on 31/03/22.
//

import UIKit

public class CircleProgressView: UIView {

    // MARK: - Properties
    private var circleLayer = CAShapeLayer()
    private var completionProgressLayer = CAShapeLayer()
    private var circleColor: UIColor
    private var completionProgressColor: UIColor
    private var circleRadius: Float
    public var progress: Float {
        didSet {
            makeCircularPath()
        }
    }

    // MARK: - Initializer
    public init(
        circleColor: UIColor,
        completionProgressColor: UIColor,
        radius: Float,
        progress: Float
    ) {
        self.circleColor = circleColor
        self.completionProgressColor = completionProgressColor
        self.circleRadius = radius
        self.progress = progress

        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Subviews
    private func makeCircularPath() {
        let completionBarLayerPath = UIBezierPath(
            arcCenter: CGPoint(
                x: frame.size.width/3,
                y: frame.size.height/3
            ),
            radius: CGFloat(self.circleRadius),
            startAngle: CGFloat(0).toRadians(),
            endAngle: CGFloat(360).toRadians() * CGFloat(progress)/100,
            clockwise: true
        )

        let circleLayerPath = UIBezierPath(
            arcCenter: CGPoint(
                x: frame.size.width/2,
                y: frame.size.height/2
            ),
            radius: CGFloat(self.circleRadius),
            startAngle: CGFloat(0).toRadians(),
            endAngle: CGFloat(360).toRadians(),
            clockwise: true
        )

        circleLayer.path = circleLayerPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = circleColor.cgColor
        circleLayer.lineWidth = 15
        circleLayer.strokeEnd = 1.0

        layer.addSublayer(circleLayer)

        completionProgressLayer.path = completionBarLayerPath.cgPath
        completionProgressLayer.fillColor = UIColor.clear.cgColor
        completionProgressLayer.strokeColor = completionProgressColor.cgColor
        completionProgressLayer.lineWidth = 15.0
        completionProgressLayer.strokeEnd = 1.0
        completionProgressLayer.lineCap = .round

        layer.addSublayer(completionProgressLayer)
    }
}
