import UIKit

public struct GradientComponents {

    let color: UIColor
    let location: Double

}

public protocol Gradient {

    var angle: GradientAngle { get }
    func makeGradientComponents() -> [GradientComponents]

}
