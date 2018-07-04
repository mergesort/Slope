import UIKit

public struct GradientComponents {
    
    let color: UIColor
    let location: Double
}

public protocol Gradient {
    
    var startPoint: CGPoint { get }
    func makeGradientComponents() -> [GradientComponents]
    
}
