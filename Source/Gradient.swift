import UIKit

public protocol Gradient {

    var angle: GradientAngle { get }
    func makeGradientComponents() -> [GradientComponents]

}

public struct GradientComponents {

    let color: UIColor
    let location: Double

}

public struct GradientAngle {

    public let start: CGPoint
    public let end: CGPoint

    init(start: CGPoint, end: CGPoint) {
        self.start = start
        self.end = end
    }

    var reversed: GradientAngle {
        return GradientAngle(start: self.end, end: self.start)
    }

    public static let defaultAngle = GradientAngle.vertical

    public static let bottomLeftToTopRight: GradientAngle = GradientAngle(
        start: CGPoint(x: 0.0, y: 1.0),
        end: CGPoint(x: 1.0, y: 0.0)
    )

    public static let topLeftToBottomRight: GradientAngle = GradientAngle(
        start: CGPoint(x: 0.0, y: 0.0),
        end: CGPoint(x: 1.0, y: 0.0)
    )

    public static let horizontal: GradientAngle = GradientAngle(
        start: CGPoint(x: 0.0, y: 0.5),
        end: CGPoint(x: 1.0, y: 0.5)
    )

    public static let vertical: GradientAngle = GradientAngle(
        start: CGPoint(x: 0.5, y: 0.0),
        end: CGPoint(x: 0.5, y: 1.0)
    )

}
