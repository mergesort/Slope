//
//  UniformGradientViewController.swift
//  GradientKit
//
//  Created by Joe Fabisevich on 7/4/18.
//  Copyright © 2018 Mergesort. All rights reserved.
//

import UIKit

class UniformGradientViewController: UIViewController {

    private let backgroundGradientView: GradientView = {
        let gradientView = GradientView()
        gradientView.gradient = UniformGradient(colors: [#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)], angle: GradientAngle.vertical.reversed)

        return gradientView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundGradientView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.backgroundGradientView)

        let backgroundConstraints = [
            self.backgroundGradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundGradientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backgroundGradientView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundGradientView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ]

        NSLayoutConstraint.activate(backgroundConstraints)
    }

}

