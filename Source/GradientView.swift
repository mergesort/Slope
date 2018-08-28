import UIKit

public final class GradientView: UIView {

    private let gradientLayer = CAGradientLayer()

    /// The backing `Gradient` which will be displayed in the view.
    public var gradient: Gradient = UniformGradient(colors: [.white]) {
        didSet {
            self.generateGradient()
        }
    }

    // MARK: Initializers

    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.setup()
    }

    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func layoutSubviews() {
        super.layoutSubviews()

        self.gradientLayer.frame = self.bounds
    }

}

private extension GradientView {

    func setup() {
        self.isUserInteractionEnabled = false
        self.layer.addSublayer(self.gradientLayer)
    }

    func generateGradient() {
        self.gradientLayer.startPoint = self.gradient.angle.start
        self.gradientLayer.endPoint = self.gradient.angle.end
        
        let components = self.gradient.makeGradientComponents()
        let colors = components.map { $0.color.cgColor }
        let locations = components.map { NSNumber(value: $0.location) }
        
        self.gradientLayer.colors = colors
        self.gradientLayer.locations = locations
    }

}
