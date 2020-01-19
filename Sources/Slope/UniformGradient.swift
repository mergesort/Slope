import UIKit

/// A `Gradient` that evenly distributes it's colors.
public struct UniformGradient: Gradient {

    /// The colors that will be used to construct the gradient with an equal distribution.
    public let colors: [UIColor]

    public let angle: GradientAngle

    // MARK: Initializers

    public init(colors: [UIColor], angle: GradientAngle = .defaultAngle) {
        self.colors = colors
        self.angle = angle
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
