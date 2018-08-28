import UIKit

/// A protocol that serves as the base for constructing concrete `Gradient` types.
public protocol Gradient {

    /// The angle that is needed to construct a `Gradient`.
    var angle: GradientAngle { get }
    
    /// An array of `GradientComponents` that will be used in constructing a full gradient.
    ///
    /// - Returns: The array of `GradientComponents` which are used to construct a `Gradient`.
    func makeGradientComponents() -> [GradientComponents]

}

/// The basic component needed to construct a `Gradient`.
/// A `Gradient` is created when you compile an array of `GradientComponents`.
public struct GradientComponents {

    let color: UIColor
    let location: Double

}

/// A `GradientAngle` defines the shape of a `Gradient`.
public struct GradientAngle {

    /// The start point of the `GradientAngle`.
    public let start: CGPoint
    
    /// The end point of the `GradientAngle`.
    public let end: CGPoint

    /// Creates a GradientAngle from a start point and end point.
    ///
    /// - Parameters:
    ///   - start: The start point of the `GradientAngle`.
    ///   - end: The end point of the `GradientAngle`.
    init(start: CGPoint, end: CGPoint) {
        self.start = start
        self.end = end
    }

    /// A `GradientAngle` that swaps the end point and start point.
    /// This is useful if you want to create a gradient that goes from
    /// dark to light rather than light to dark.
    var reversed: GradientAngle {
        return GradientAngle(start: self.end, end: self.start)
    }

    /// `GradientAngle.vertical`
    public static let defaultAngle = GradientAngle.vertical

    /// Used for creating a diagonal gradient that starts in the bottom left corner and goes to the top right corner.
    public static let bottomLeftToTopRight: GradientAngle = GradientAngle(
        start: CGPoint(x: 0.0, y: 1.0),
        end: CGPoint(x: 1.0, y: 0.0)
    )

    /// Used for creating a diagonal gradient that starts in the top left corner and goes to the bottom right corner.
    public static let topLeftToBottomRight: GradientAngle = GradientAngle(
        start: CGPoint(x: 0.0, y: 0.0),
        end: CGPoint(x: 1.0, y: 0.0)
    )

    /// Used for creating a gradient that starts from the left center and ends in the right center.
    public static let horizontal: GradientAngle = GradientAngle(
        start: CGPoint(x: 0.0, y: 0.5),
        end: CGPoint(x: 1.0, y: 0.5)
    )

    /// Used for creating a gradient that starts from the top center and ends in the bottom center.
    public static let vertical: GradientAngle = GradientAngle(
        start: CGPoint(x: 0.5, y: 0.0),
        end: CGPoint(x: 0.5, y: 1.0)
    )

}
