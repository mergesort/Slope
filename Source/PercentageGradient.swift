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
    
    case horizontal
    case vertical
    case diagonalAscending
    case diagonalDescending
    
    func gradientPoints() -> GradientPoints {
        switch self {
        case .horizontal:
            return GradientPoints(start: CGPoint(x: 0.0, y: 0.5), end: CGPoint(x: 1.0, y: 0.5))
        case .vertical:
            return GradientPoints(start: CGPoint(x: 0.5, y: 0.0), end: CGPoint(x: 0.5, y: 1.0))
        case .diagonalAscending:
            return GradientPoints(start: CGPoint(x: 0.0, y: 1.0), end: CGPoint(x: 1.0, y: 0.0))
        case .diagonalDescending:
            return GradientPoints(start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: 1.0, y: 1.0))
        }
    }
    
}

public struct PercentageGradient: Gradient {

    public var angle: GradientAngle?
    public let baseColor: UIColor
    public let direction: GradientDirection
    public let percentage: CGFloat
    public let startPoint: CGPoint
    public let endPoint: CGPoint

    public init(baseColor: UIColor, direction: GradientDirection, percentage: CGFloat, startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0)) {
        self.baseColor = baseColor
        self.direction = direction
        self.percentage = percentage
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    public init(baseColor: UIColor, direction: GradientDirection, percentage: CGFloat, angle: GradientAngle) {
        self.init(baseColor: baseColor, direction: direction, percentage: percentage, startPoint: angle.gradientPoints().start, endPoint: angle.gradientPoints().end)
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
