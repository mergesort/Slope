import UIKit

public enum GradientDirection {

    case darkToLight
    case lightToDark

}

public struct GradientPoints {
    
    public var start: CGPoint
    public var end: CGPoint
    
}

public enum GradientAngle {
    
    public static let defaultAngle = GradientAngle.vertical
    var gradientPoints: GradientPoints {
        switch self {
        case .custom (let start, let end):
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
    
    case custom(start: CGPoint, end: CGPoint)
    case bottomLeftToTopRight
    case topLeftToBottomRight
    case horizontal
    case vertical
    
}

public struct PercentageGradient: Gradient {

    public let angle: GradientAngle
    public let baseColor: UIColor
    public let direction: GradientDirection
    public let percentage: CGFloat
    
    public init(baseColor: UIColor, direction: GradientDirection = .lightToDark, percentage: CGFloat, angle: GradientAngle = .defaultAngle) {
        self.angle = angle
        self.baseColor = baseColor
        self.direction = direction
        self.percentage = percentage
    }

}

public extension PercentageGradient {

    func makeGradientComponents() -> [GradientComponents] {
        switch self.direction {

        case .darkToLight:
            return [
                GradientComponents(
                    color: self.darkerColor(from: baseColor),
                    location: 0.0
                ),
                GradientComponents(
                    color: self.lighterColor(from: baseColor),
                    location: 1.0
                ),
            ]

        case .lightToDark:
            return [
                GradientComponents(
                    color: self.lighterColor(from: baseColor),
                    location: 0.0
                ),
                GradientComponents(
                    color: self.darkerColor(from: baseColor),
                    location: 1.0
                ),
            ]
        }
    }

}


extension PercentageGradient {

    func lighterColor(from color: UIColor) -> UIColor {
        switch self.direction {

        case .darkToLight:
            return color

        case .lightToDark:
            return (color.changedBrightness(byPercentage: self.percentage) ?? UIColor.white)
        }
    }
    
    func darkerColor(from color: UIColor) -> UIColor {
        switch self.direction {

        case .darkToLight:
            return (color.changedBrightness(byPercentage: -self.percentage) ?? UIColor.black)

        case .lightToDark:
            return color
        }
    }

}

private extension UIColor {

    func hsba() -> (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat)? {
        var hue: CGFloat = .nan
        var saturation: CGFloat = .nan
        var brightness: CGFloat = .nan
        var alpha: CGFloat = .nan

        guard self.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else { return nil }

        return (hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
    }
    
    func changedBrightness(byPercentage percent: CGFloat) -> UIColor? {
        guard percent != 0 else { return self.copy() as? UIColor }

        guard let hsba = self.hsba() else { return nil }

        let percentage: CGFloat = min(max(percent, -1), 1)
        let newBrightness = min(max(hsba.brightness + percentage, -1), 1)
        return UIColor(hue: hsba.hue, saturation: hsba.saturation, brightness: newBrightness, alpha: hsba.alpha)
    }

}
