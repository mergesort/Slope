import UIKit

public protocol Gradient {

    var angle: GradientAngle { get }
    func makeGradientComponents() -> [GradientComponents]

}

public struct GradientComponents {
    
    let color: UIColor
    let location: Double
    
}

public struct GradientPoints {
    
    public var start: CGPoint
    public var end: CGPoint
    
}

public enum GradientAngle {
    
    case custom(start: CGPoint, end: CGPoint)
    case bottomLeftToTopRight
    case topLeftToBottomRight
    case horizontal
    case vertical
    
    public static let defaultAngle = GradientAngle.vertical
    
    var gradientPoints: GradientPoints {
        switch self {
            
        case .custom(let start, let end):
            return GradientPoints(start: start, end: end)
            
        case .bottomLeftToTopRight:
            return GradientPoints(start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: 1.0, y: 0.0))
            
        case .topLeftToBottomRight:
            return GradientPoints(start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: 1.0, y: 1.0))
            
        case .horizontal:
            return GradientPoints(start: CGPoint(x: 0.0, y: 0.5), end: CGPoint(x: 1.0, y: 0.5))
            
        case .vertical:
            return GradientPoints(start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
        }
    }
    
}
