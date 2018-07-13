import UIKit

public struct UniformGradient: Gradient {

    public let colors: [UIColor]
    public let endPoint: CGPoint
    public let startPoint: CGPoint
    public var angle: GradientAngle?

    public init(colors: [UIColor], startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0)) {
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    public init(colors: [UIColor], angle: GradientAngle) {
        self.init(colors: colors, startPoint: angle.gradientPoints().start, endPoint: angle.gradientPoints().end)
    }

}

public extension UniformGradient {

    func makeGradientComponents() -> [GradientComponents] {
        let min = 0.0
        let max = 1.0
        let by = (max-min)/Double(self.colors.count - 1)

        let locations = stride(from: min, through: max, by: by)
            .map { $0 }

        return zip(colors, locations)
            .map { GradientComponents(color: $0, location: $1) }
    }

}
