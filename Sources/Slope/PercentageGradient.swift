import UIKit

/// A `Gradient` that uses a base color and a percentage to offset.
public struct PercentageGradient: Gradient {

    /// The color that will serve as the foundation of the gradient.
    /// This is the color you will see at the center of the gradient,
    /// and be lighter or darker outward from that point.
    public let baseColor: UIColor

    public let angle: GradientAngle

    /// The percentage that the `baseColor` will be modified.
    public let percentage: CGFloat

    // MARK: Initializers

    public init(baseColor: UIColor, angle: GradientAngle = .defaultAngle, percentage: CGFloat) {
        self.angle = angle
        self.baseColor = baseColor
        self.percentage = percentage
    }

}

public extension PercentageGradient {

    func makeGradientComponents() -> [GradientComponents] {
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

private extension PercentageGradient {

    func lighterColor(from color: UIColor) -> UIColor {
        return (color.brightnessOffset(byPercentage: self.percentage) ?? UIColor.white)
    }

    func darkerColor(from color: UIColor) -> UIColor {
        return (color.brightnessOffset(byPercentage: -self.percentage) ?? UIColor.black)
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
    
    func brightnessOffset(byPercentage percent: CGFloat) -> UIColor? {
        guard percent != 0 else { return self.copy() as? UIColor }

        guard let hsba = self.hsba() else { return nil }

        let percentage: CGFloat = min(max(percent, -1), 1)
        let newBrightness = min(max(hsba.brightness + percentage, -1), 1)
        return UIColor(hue: hsba.hue, saturation: hsba.saturation, brightness: newBrightness, alpha: hsba.alpha)
    }

}
